import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:providerdemo/model/model.dart';
import 'package:providerdemo/provider/provider.dart';
import 'package:providerdemo/view/home.dart';



class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    Future<void> _registration() async {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      SignUpBody signUpBody = SignUpBody(
          name: name, phone: phone, email: email, password: password);
      var provider = Provider.of<DataClass>(context, listen: false);
      await provider.postData(signUpBody);
      if (provider.isBack) {
      
      }
    }

   

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 237, 137, 137),

        ),
          backgroundColor: Colors.grey[300],
          body: Consumer<DataClass>(builder: (context, data, child) {
            return data.loading
                ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: SpinKitThreeBounce(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
                : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                   
                    //app logo
                    Container(
                        height: 100,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 80,
                          ),
                        )),
                    //your email
                    TextField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: 'email', ),
                       
                      
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    //your password
                    TextField(
                        controller: passwordController,
                         decoration: const InputDecoration(labelText: 'pass', ),),
                    const SizedBox(
                      height: 20,
                    ),
                    //your name
                    TextField(
                        controller: nameController,
                         decoration: const InputDecoration(labelText: 'name', ),),
                    const SizedBox(
                      height: 20,
                    ),
                    //your phone
                    TextField(
                        controller: phoneController,
                         decoration: const InputDecoration(labelText: 'phoe', ),),
                    const SizedBox(
                      height: 20 + 20,
                    ),
                    //sign up button
                  
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
  GestureDetector(
                      onTap: () {
                        _registration().then((value) => 
                        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   PostListScreen()),
        ),
                        );
                      },
                      child: Container(
                        
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 23),
                        margin: const EdgeInsets.only(left: 40, right: 40),
                        child: const Text(
                          "save",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF74beef),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ]),
                      ),
                    ),
 GestureDetector(
                      onTap: () {
                       
                        nameController.clear();
                        passwordController.clear();
                        emailController.clear();
                        phoneController.clear();

                       
                      },
                      child: Container(
                      
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 23),
                     
                        child: const Text(
                          "clear",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF74beef),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ]),
                      ),
                    ),
                      ],
                    ),
                    
                    //tag line
                   
                  ],
                ),
              ),
            );
          })),
    );
  }
}