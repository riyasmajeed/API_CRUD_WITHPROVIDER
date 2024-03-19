import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:providerdemo/model/model.dart';
import 'package:providerdemo/provider/getmth/getfun.dart';

class ClassData extends ChangeNotifier {
  List<SignUpBody>? posts; 
  bool loading = false;

  void getPostData() async {
    loading = true;
    final fetchedPost = await getSinglePostData();
    if (fetchedPost != null) {
       posts = fetchedPost;
    } else {
      // Handle the case where getSinglePostData() returns null
      // For example, you could set post to a default value or handle it in another way
    }
    loading = false;
    notifyListeners();
  }

void deletePost(int index) {
    if (posts != null && index < posts!.length) {
      posts!.removeAt(index);
      notifyListeners();
    }
  }

   void updatePost(int index, SignUpBody updatedPost) {
    if (posts != null && index < posts!.length) {
      posts![index] = updatedPost;
      notifyListeners();
    }
  }

}
