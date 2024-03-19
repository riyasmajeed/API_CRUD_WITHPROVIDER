import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:providerdemo/model/model.dart';

Future<http.Response?> register(SignUpBody data) async {
  http.Response? response;
  try {
    response =
    await http.post(
        Uri.parse("https://crudcrud.com/api/a843b908778642bdb531fdbe10888c41/unicorns"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
  } catch (e) {
    log(e.toString());
  }
  return response;
}