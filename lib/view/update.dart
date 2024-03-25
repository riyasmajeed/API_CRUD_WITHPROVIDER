import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:providerdemo/model/model.dart';
import 'package:providerdemo/provider/provider.dart';

class UpdatePage extends StatelessWidget {
  final String id;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  UpdatePage({required this.id});

  @override
  Widget build(BuildContext context) {
    final dataClassprovider = Provider.of<DataClassprovider>(context);

    // Find the data by ID
    final posts = dataClassprovider.getdataById(id);

    // Set initial values for text controllers
    nameController.text = posts?.name ?? '';
    passwordController.text = posts?.password ?? '';
    phoneController.text = posts?.phone ?? '';
    emailController.text = posts?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'phone'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'email'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Construct the update body
                  SignUpBody updateDataBody = SignUpBody(
                    name: nameController.text,
                    password: passwordController.text,
                    id: id,
                    phone: phoneController.text,
                    email: emailController.text,
                  );
        
                  // Call the update method
                  await dataClassprovider.updateBook(id, updateDataBody);
                  // Navigate back to previous screen
                  Navigator.pop(context);
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
