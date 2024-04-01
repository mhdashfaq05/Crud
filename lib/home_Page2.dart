import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/add_user.dart';
import 'package:crud/login_signup.dart';
import 'package:crud/profile_page.dart';
import 'package:crud/colorconst.dart';
import 'package:crud/getpage.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edituser.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  // List home = [
  //   {
  //     "image":ImageConst.boy,
  //     "text":"Albert Flores",
  //     "text1":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon":ImageConst.pen,
  //     "icon1":ImageConst.delete
  //   },
  //   {
  //     "image":ImageConst.boy,
  //     "text":"Albert Flores",
  //     "text1":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon":ImageConst.pen,
  //     "icon1":ImageConst.delete
  //   },
  //   {
  //     "image":ImageConst.boy,
  //     "text":"Albert Flores",
  //     "text1":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon":ImageConst.pen,
  //     "icon1":ImageConst.delete
  //   },
  //   {
  //     "image":ImageConst.boy,
  //     "text":"Albert Flores",
  //     "text1":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon":ImageConst.pen,
  //     "icon1":ImageConst.delete
  //   },
  //   {
  //     "image":ImageConst.boy,
  //     "text":"Albert Flores",
  //     "text1":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon":ImageConst.pen,
  //     "icon1":ImageConst.delete
  //
  //   },
  //   {
  //     "image":ImageConst.boy,
  //     "text":"Albert Flores",
  //     "text1":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon":ImageConst.pen,
  //     "icon1":ImageConst.delete
  //
  //   },
  //   {
  //     "image":ImageConst.boy,
  //     "text":"Albert Flores",
  //     "text1":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon":ImageConst.pen,
  //     "icon1":ImageConst.delete
  //   },
  //   {
  //     "image":ImageConst.boy,
  //     "text":"Albert Flores",
  //     "text1":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "icon":ImageConst.pen,
  //     "icon1":ImageConst.delete
  //   },
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1,
        backgroundColor: ColorConst.white,
        title: Text(
          "Hello, User",
          style: TextStyle(color: ColorConst.Black,fontWeight: FontWeight.w600),
        ),
        actions: [
          Row(
            children: [
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => Profile_Page(),
                ));
                setState(() {

                });
              },child: Image.asset(ImageConst.ProfilePic,width: w*0.12)),
              SizedBox(width: w*0.03),
              InkWell(
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login_signup(),));
                    setState(() {

                    });
                  },child: SvgPicture.asset(ImageConst.Logout))

            ],
          )
        ],

      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser(),));
        },
        child: CircleAvatar(
          backgroundColor: ColorConst.PrimaryColor,
            radius: 35,
            child: Icon(Icons.add,color: Colors.white,size: w*0.08,)
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(w * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Current Users",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: w * 0.05),
                  ),
                ],
              ),
            ),
            StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
                stream: FirebaseFirestore.instance.collection("users").doc("mhdashfaq5588@gmail.com").snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  var data=snapshot.data!.data();
                  return Column(
                    children: [
                      Text(data!["name"]),
                      Text(data["email"]),

                    ],
                  );
                },
            ),
            Container(
              height: w*2.2,
              width: w*1,
              child: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                stream: FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  List data=snapshot.data!.docs;
                  return ListView.separated(
                    itemCount: data.length,
                    shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(padding: EdgeInsets.all(w*0.03),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => GetPage(id: data[index].id,),));
                            setState(() {

                            });
                          },
                          child: Container(
                            height: w*0.2,
                            width: w*0.33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.04),
                              color: ColorConst.lightGrey
                            ),
                            child: ListTile(
                              leading:CircleAvatar(
                                radius: w*0.08,
                                backgroundImage: NetworkImage(data[index]["image"]),
                              ),
                              title: Row(
                                children: [
                                  Text(data[index]["name"],
                                  style: TextStyle(fontSize: w*0.03,
                                  fontWeight: FontWeight.w600
                                  ),
                                  )
                                ],
                              ),
                              subtitle: Row( mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(data[index]["email"],style: TextStyle(fontSize: w*0.03),)
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        showCupertinoModalPopup(context: context, builder: (context) {
                                          return CupertinoAlertDialog(
                                            title: Text("Are you Sure\nYou Want to delete User ?"),
                                            actions: [
                                              Column(
                                                children: [
                                                  CupertinoDialogAction(

                                                      onPressed:() {
                                                        Navigator.pop(context);
                                                        FirebaseFirestore.instance.collection("users").doc(data[index]["email"]).delete();
                                                        setState(() {

                                                        });
                                                      },
                                                      child: Text("yes",style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.red),)),
                                                  Divider(),
                                                  CupertinoDialogAction(child: Text("Cancel"),onPressed: (){
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
                                      child: Container(
                                          width: w*0.08,
                                          height: w*0.06,
                                         //color: Colors.red,
                                          child: SvgPicture.asset(ImageConst.delete))),
                                  SizedBox(width: w*0.02,),
                                  InkWell(onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditUser(

                                      userId: data[index]["email"],
                                      name: data[index]["name"],
                                      email: data[index]["email"],
                                      password: data[index]["password"],
                                      image: data[index]["image"],

                                    ),));
                                    setState(() {

                                    });
                                  },child: Container(
                                    width: w*0.08,
                                      height: w*0.06,
                                      //color: Colors.red,
                                      child: SvgPicture.asset(ImageConst.editpen,width: w*0.05,)))
                                ],
                              ),
                            ),
                          ),
                        ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: w*0.0001,
                        );
                      },
                      );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
