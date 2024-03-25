
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/adduser/add.dart';

import 'package:providerdemo/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/view/home.dart';




void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
 const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (context) => DataClassprovider(),
      child: MaterialApp(
        routes:
        {
          // "adduser" :(BuildContext context) => (),
        } ,
          debugShowCheckedModeBanner: false,
       home:  PostListScreen(),
      
        
        
      ),
    );
  }
}
