import 'dart:io';

import 'package:crud/home_Page1.dart';
import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  bool a = false;
  bool b = false;
  var file;
  Future<void> pickimage(ImageSource a) async {
    ImagePicker imagePicker = ImagePicker();
    final imamefile = await imagePicker.pickImage(source: a);
    file = File(imamefile!.path);
    if (mounted) {
      file = File(imamefile.path);
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {

              });
            },
            child: Container(
                height: w*0.05,
                width: w*0.05,
                //color: Colors.blueGrey,
                child: Center(child: SvgPicture.asset(ImageConst.Shape,))),
          ),
        ),
        backgroundColor: ColorConst.white,
        title: Text("Profile",
            style: TextStyle(
              color: ColorConst.Black,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            )), // TextStyle, Text
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            children: [
        Column(
        children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: w * 0.45,
            width: w * 0.29,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Center(
                      child: file == null
                          ? CircleAvatar(
                          radius: w * 0.2,
                          backgroundImage:
                          AssetImage(ImageConst.ProfilePic))
                          : CircleAvatar(
                        radius: w * 0.2,
                        backgroundImage: FileImage(file),
                      ),
                    ),
                    Positioned(
                      top: w * 0.25,
                      left: w * 0.22,
                      child: InkWell(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                actions: [
                                  CupertinoActionSheetAction(
                                      onPressed: () {
                                        pickimage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Gallery Photos")),
                                  CupertinoActionSheetAction(
                                      onPressed: () {
                                        pickimage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Camera")),
                                ],
                                cancelButton:
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: Text("cancel"),
                                ),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: ColorConst.PrimaryColor,
                          radius: w * 0.033,
                          child: CircleAvatar(
                            child: SvgPicture.asset(ImageConst.editpen,
                                color: Colors.white),
                            backgroundColor: ColorConst.PrimaryColor,
                            radius: w * 0.02,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ])
        ],
      ),
              Padding(
                padding: EdgeInsets.all(w * 0.03),
                child: Column(children: [
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   if(emailValid.hasMatch(value!)){
                    //     return null;
                    //   }
                    //   else{
                    //     return "Enter a Valid Email";
                    //   }
                    // },
                    // controller: email,
                    decoration: InputDecoration(
                      label:
                      Text("Username"),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.04),
                          borderSide: BorderSide(
                            color: ColorConst.PrimaryColor,
                          )),
                      hintText: ("UserName"),
                    ),
                  ),
                  SizedBox(
                    height: w * 0.06,),

                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   if(emailValid.hasMatch(value!)){
                    //     return null;
                    //   }
                    //   else{
                    //     return "Enter a Valid Email";
                    //   }
                    // },
                    // controller: email,
                    decoration: InputDecoration(
                      label:
                      Text("Email"),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.04),
                          borderSide: BorderSide(
                            color: ColorConst.PrimaryColor,
                          )),
                      hintText: ("user@gmail.com"),
                    ),
                  ),
                  SizedBox(
                    height: w * 0.06,
                  ),
                  TextFormField(
                      // controller: password,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: a,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        border: OutlineInputBorder(),


                        filled: true,


                        suffixIcon: InkWell(
                            onTap: () {
                              a = !a;
                              setState(() {});
                            },
                            child: Icon(
                                a ? Icons.lock_open : Icons.lock_outlined)),
                        hintText: "password",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                            BorderSide(color: ColorConst.lightGrey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide: BorderSide(
                              color: ColorConst.PrimaryColor,
                            )),
                      )),


                ]),
              ),
              SizedBox(height: w*0.07,),
               InkWell(onTap: () {
                 showCupertinoModalPopup(context: context, builder: (context) {
                   return CupertinoAlertDialog(
                     title: Text("Are you Sure \nYou Want to Update Details?"),
                     actions: [
                       Column(
                         children: [
                           CupertinoDialogAction(child: Text("Confirm",),onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage1(),));
                             setState(() {

                             });
                           },),
                           Divider(),
                           CupertinoDialogAction(child: Text("Cancel",style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.red),),onPressed: (){
                             Navigator.pop(context);
                             setState(() {

                             });
                           }),
                         ],
                       )
                     ],
                   );
                 },);
               },

              child:
              Container(
                height: w * 0.13,
                width: w * 0.7,
                decoration: BoxDecoration(
                    color: ColorConst.white,
                    borderRadius: BorderRadius.circular(w * 0.06),
                    border: Border.all(
                        color: ColorConst.PrimaryColor, width: w * 0.005)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update",
                      style: TextStyle(
                          color: ColorConst.PrimaryColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),

               )
            ]
        ),
    )
    );
  }
}
