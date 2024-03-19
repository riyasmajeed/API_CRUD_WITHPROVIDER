
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/adduser/add.dart';
import 'package:providerdemo/provider/getmth/getdemo.dart';
import 'package:providerdemo/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/view/home.dart';

void main() {
  runApp(MultiProvider(providers: [

    ChangeNotifierProvider(create: (_) =>DataClass()),
    ChangeNotifierProvider(create: (_)=>ClassData()),
    // ChangeNotifierProvider(create: (context) => getprofileprvider(),)

    

  ],child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
 const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:
      {
        // "adduser" :(BuildContext context) => (),
      } ,
        debugShowCheckedModeBanner: false,
 home:  SignUpPage(),

      
      
    );
  }
}
