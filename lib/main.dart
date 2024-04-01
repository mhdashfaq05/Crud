import 'package:crud/NewTask1.dart';
import 'package:crud/New_Task2.dart';
import 'package:crud/riverpod.dart';
import 'package:crud/login_signup.dart';
import 'package:crud/splash_screen.dart';
import 'package:crud/task_page1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

var w;
var h;


testFunction(){
  print("hello world");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Crud());
}class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Task_Page1(),
        //theme: ThemeData(),
      ),
    );

  }
}