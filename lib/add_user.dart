import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'Model/adduserModel.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool a = false;
  bool b = false;
  var file;
  String imgUrll =
      "https://www.nevadahealthcenters.org/wp-content/uploads/2018/09/no-profile-picture.jpg";
  Future<void> pickimage(ImageSource a) async {
    ImagePicker imagePicker = ImagePicker();
    final imamefile = await imagePicker.pickImage(source: a);
    if (mounted) {
      file = File(imamefile!.path);
      setState(() {});
    }
    uploadFile();
  }

  uploadFile() async {
    String format = file!.path.split('.').last;
    var uploadTask = await FirebaseStorage.instance
        .ref('uploads/images')
        .child(DateTime.now().toString())
        .putFile(file!, SettableMetadata(contentType: 'image/$format'));
    var getUrl = await uploadTask.ref.getDownloadURL();

    imgUrll = getUrl;
    setState(() {});

    //print(getUrl);
  }

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confrimpassword = TextEditingController();
  @override
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
            child: SizedBox(
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
        title: Text("Add User",
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
                  SizedBox(
                    height: w * 0.45,
                    width: w * 0.29,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Center(
                                child: CircleAvatar(
                                    radius: w * 0.2,
                                    backgroundImage: NetworkImage(imgUrll))),
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
                                       ),
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
                      controller: name,
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
                      controller: email,
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
                      controller: password,
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
                      controller: confrimpassword,
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
                Map<String, dynamic> data = {
                  "name": name.text,
                  "image": imgUrll,
                  "email": email.text,
                  "password": password.text
                };
                // FirebaseFirestore.instance.collection("users").add(data);
                // FirebaseFirestore.instance
                //     .collection("users")
                //     .doc(email.text)
                //     .set(addUserModel(
                //             name: name.text, email: email.text, password: password.text)
                //         .toMap());
                // Navigator.pop(context);
                setState(() {});
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
                      "Add User",
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
