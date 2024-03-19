import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/model/model.dart';
import 'package:providerdemo/provider/getmth/getdemo.dart'; // Import your ClassData provider

class UpdatePostScreen extends StatefulWidget {
  final SignUpBody post;
  final int index;

  UpdatePostScreen({required this.post, required this.index});

  @override
  _UpdatePostScreenState createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current post data
    _nameController = TextEditingController(text: widget.post.name);
    _emailController = TextEditingController(text: widget.post.email);
  }

  @override
  void dispose() {
    // Dispose text controllers
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update post data and pop the screen
                SignUpBody updatedPost = SignUpBody(
                  name: _nameController.text,
                  phone: widget.post.phone, // Keep phone same as original
                  email: _emailController.text,
                  password: widget.post.password, // Keep password same as original
                );
                Provider.of<ClassData>(context, listen: false).updatePost(widget.index, updatedPost);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
