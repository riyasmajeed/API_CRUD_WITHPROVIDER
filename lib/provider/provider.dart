import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart'; // Import collection package for firstWhereOrNull method

import 'package:providerdemo/model/model.dart';


class DataClassprovider extends ChangeNotifier {
  List<SignUpBody> _post = [];

  List<SignUpBody> get post => _post;

  final String apiUrl =
      'https://crudcrud.com/api/7c8275cbf4f7406b8789b1a05b14e74f/unicorns';

  Future<void> fetchdata() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);
        _post =
            decodedData.map((json) => SignUpBody.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load post from API');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> adddata(
      String name, String phone, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {'name': name, 'phone': phone, 'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        fetchdata(); // Refresh books after adding
      } else {
        throw Exception(
            'Failed to add book. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  SignUpBody? getdataById(String id) {
    return _post.firstWhereOrNull((posts) => posts.id == id);
  }

  Future<void> updateBook( String id,SignUpBody updateSignUpBody ) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(updateSignUpBody.toJson()),
      );

      if (response.statusCode == 200) {
        fetchdata(); // Refresh books after updating
      } else {
        throw Exception(
            'Failed to update book. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$apiUrl/$id'),
      );

      if (response.statusCode == 200) {
        fetchdata(); // Refresh books after deleting
      } else {
        throw Exception(
            'Failed to delete book. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
