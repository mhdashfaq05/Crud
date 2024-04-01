import 'package:crud/home_Page1.dart';
import 'package:crud/login_signup.dart';
import 'package:crud/colorconst.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool login=false;

  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login==true?Login_signup():HomePage1()), (route) => false);
    });
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.PrimaryColor,
      body: Center(
        child: Text("CRUD",style: TextStyle(color: Colors.white,fontSize: w*0.1,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
