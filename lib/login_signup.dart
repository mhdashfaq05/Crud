import 'package:crud/login_login.dart';
import 'package:crud/sign_up.dart';
import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:flutter/material.dart';

class Login_signup extends StatefulWidget {
  const Login_signup({super.key});

  @override
  State<Login_signup> createState() => _Login_signupState();
}

class _Login_signupState extends State<Login_signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: SafeArea(
       child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Column(
             children: [
               Image.asset(ImageConst.loginscreenimg)
             ],
           ),
           Column(
             children: [
               Text("CRUD",style: TextStyle(fontWeight: FontWeight.w600,color: ColorConst.PrimaryColor,fontSize: w*0.06),),
               Text("Create, Read, Update ,Delete",style: TextStyle(color: ColorConst.PrimaryColor),),
             ],
           ),
           Column(
             children: [
               InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Screen(),));
                  setState(() {

                  });
                }, child: Container(
                   height: w* 0.10,
                   width: w* 0.6,
                   decoration: BoxDecoration(
                     color: ColorConst.PrimaryColor,
                     borderRadius: BorderRadius.circular(w* 0.3),
                   ),
                   child: Center(
                     child: Text("Login",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w800)),
                   ),
                 ),
               ),
               SizedBox(height: w*0.040),
               InkWell(onTap:() {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_Up(),
                 )
                 );
                 setState(() {

                 });
               } ,
                 child: Container(
                   height: w* 0.10,
                   width: w* 0.6,
                   decoration: BoxDecoration(
                     border: Border.all(color: ColorConst.PrimaryColor,width: w*0.003),
                     borderRadius: BorderRadius.circular(w* 0.3),

                   ),
                   child: Center(
                     child: Text("Sign up",style: TextStyle(color:ColorConst.PrimaryColor,fontWeight: FontWeight.w800)),
                   ),
                 ),
               ),
             ],
           ),

         ],
       ),
     ),
    );
  }
}
