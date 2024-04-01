import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/home_Page2.dart';
import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditUser extends StatefulWidget {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String image;
  const EditUser(
      {super.key,
      required this.userId,
      required this.name,
      required this.email,
      required this.password,
      required this.image});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  bool a = false;
  bool b = false;

  String imgUrll="";
  File? file;
  Future<void> pickimage(ImageSource a) async {
    ImagePicker imagePicker = ImagePicker();
    final imamefile = await imagePicker.pickImage(source: a);
    file = File(imamefile!.path);
    if (mounted) {
      file = File(imamefile.path);
      setState(() {});
    }
    uploadFile();
  }
  uploadFile()async{
    String format = file!.path.split('.').last;
    var uploadTask = await FirebaseStorage.instance
        .ref('uploads/images').child(DateTime.now().toString())
        .putFile(file!,SettableMetadata(
        contentType: 'image/$format'
    ));
    var getUrl = await uploadTask.ref.getDownloadURL();

    imgUrll = getUrl;
    setState(() {

    });

    //print(getUrl);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confrimpasswordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.name;
    emailController.text = widget.email;
    passwordController.text = widget.password;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {});
            },
            child: Container(
                height: w * 0.05,
                width: w * 0.05,
                //color: Colors.blueGrey,
                child: Center(
                    child: SvgPicture.asset(
                  ImageConst.Shape,
                ))),
          ),
        ),
        backgroundColor: ColorConst.white,
        title: Text("Edit User",
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
                                          NetworkImage(widget.image))
                                  : CircleAvatar(
                                      radius: w * 0.2,
                                      backgroundImage:NetworkImage(imgUrll) ,
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: TextFormField(
                      controller: nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.lightGrey,
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.person),
                        hintText: "full name",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                                BorderSide(color: ColorConst.lightGrey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                                BorderSide(color: ColorConst.lightGrey)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.lightGrey,
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.email),
                        hintText: "valid email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                                BorderSide(color: ColorConst.lightGrey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                                BorderSide(color: ColorConst.lightGrey)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: a,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.lightGrey,
                        border: InputBorder.none,
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
                            borderSide:
                                BorderSide(color: ColorConst.lightGrey)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: TextFormField(
                      controller: confrimpasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      obscureText: b,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.lightGrey,
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                            onTap: () {
                              b = !b;
                              setState(() {});
                            },
                            child: Icon(
                                b ? Icons.lock_open : Icons.lock_outlined)),
                        hintText: "confirm passsword",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                                BorderSide(color: ColorConst.lightGrey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.04),
                            borderSide:
                                BorderSide(color: ColorConst.lightGrey)),
                      )),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("Are you Sure \nYou Want to Update Details?"),
                      actions: [
                        Column(
                          children: [
                            CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage2(),
                                      ));
                                  FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(widget.email)
                                      .update({
                                    "name": nameController.text,
                                    "email": emailController.text,
                                    "password": passwordController.text,
                                    "image":imgUrll
                                  });
                                  setState(() {});
                                },
                                child: Text(
                                  "Confirm",
                                )),
                            Divider(),
                            CupertinoDialogAction(
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {});
                                }),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              child: Container(
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
                      "Edit User",
                      style: TextStyle(
                          color: ColorConst.PrimaryColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: w * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
