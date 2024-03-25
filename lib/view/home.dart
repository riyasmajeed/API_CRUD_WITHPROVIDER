import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/adduser/add.dart';
import 'package:providerdemo/model/model.dart';

import 'package:providerdemo/provider/provider.dart';
import 'package:providerdemo/view/update.dart'; // Import your ClassData provider

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    // Call fetchdata when the screen is initialized
    Provider.of<DataClassprovider>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: Consumer<DataClassprovider>(
        builder: (context, dataClassProvider, _) {
          if (dataClassProvider.post.isEmpty) {
          return Center(child: const Text("no data"));
          }
          
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                SizedBox(height: 20),
                Text(' empyoyee details'),
                Expanded(
                  child: ListView.builder(
                    itemCount: dataClassProvider.post.length,
                    itemBuilder: (context, index) {
                      final posts = dataClassProvider.post[index];
                      return ListTile(
                        title: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("name :${posts.name}"),
                              Text("email :${posts.email}"),
                              Text("pass :${posts.password}"),
                              Text("phone :${posts.phone}")
                            ],
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdatePage(id: posts.id)),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                dataClassProvider.deleteBook(posts.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );



        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Refresh data when FloatingActionButton is pressed
  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );        },
        child: Icon(Icons.add),
      ),
    );
  }
}
