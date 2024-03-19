import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/model/model.dart';
import 'package:providerdemo/provider/getmth/getdemo.dart';
import 'package:providerdemo/view/update.dart'; // Import your ClassData provider

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: Consumer<ClassData>(
        builder: (context, classData, _) {
          if (classData.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (classData.posts!.isEmpty) {
            return Center(child: Text("No data"));
          } else {
            return ListView.builder(
              itemCount: classData.posts!.length,
              itemBuilder: (context, index) {
                SignUpBody post = classData.posts![index];
                return ListTile(
                 title: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("name :${post.name}"),
                   Text("email :${post.email}"),
                   Text("pass :${post.password}"),
                   Text("phoe :${post.phone}")
                    ],
                    
                  ),
                  
                 ),
                  // Add more fields or customize the ListTile as needed
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){
                             // Navigate to the update screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UpdatePostScreen(post: post, index: index)),
                          );
                      }, icon: Icon(Icons.edit)),
                     IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirm"),
                                content: Text("Are you sure you want to delete this post?"),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text("Delete"),
                                    onPressed: () {
                                      // Delete post
                                      Provider.of<ClassData>(context, listen: false).deletePost(index);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Fetch post data when FloatingActionButton is pressed
          Provider.of<ClassData>(context, listen: false).getPostData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
