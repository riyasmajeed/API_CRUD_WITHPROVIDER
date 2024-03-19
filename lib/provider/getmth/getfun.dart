import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:providerdemo/model/model.dart';


Future<List<SignUpBody>?> getSinglePostData() async {
  List<SignUpBody>? result;
  try {
    final response = await http.get(
      Uri.parse("https://crudcrud.com/api/a843b908778642bdb531fdbe10888c41/unicorns"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> itemList = json.decode(response.body);
      result = itemList.map((item) => SignUpBody.fromJson(item)).toList();
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to fetch data: $e");
  }
  return result;
}
