import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:crud/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  List banner=[
    {
      "image":ImageConst.book,
      "text1":"Banner 1",
      "text2":"2 May",
      "icon":ImageConst.delete
    },
    {
      "image":ImageConst.homepagepng,
      "text1":"Banner 2",
      "text2":"2 May",
      "icon":ImageConst.delete
    },
    {
      "image":ImageConst.book,
      "text1":"Banner 3",
      "text2":"2 May",
      "icon":ImageConst.delete
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: w*0.05,
              width: w*0.05,
              //color: Colors.blueGrey,
              child: Center(child: SvgPicture.asset(ImageConst.Shape,))),
        ),
        title: Text("Banner",style: TextStyle(
            fontWeight: FontWeight.w700,
            color: ColorConst.Black
        ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all( w*0.05),
              child: Container(
                  height: w*0.65,
                  width: w*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.04),
                    color: Colors.lightBlue[100],
                  ),

                  child: Column(
                    children: [
                      Center(child: Image.asset(ImageConst.gallery,width: w*0.3,)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Click here to Upload",style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: w*0.05
                          ),),
                          Text("Image",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.blue,fontSize: w*0.05),)
                        ],
                      ),
                      SizedBox(height:w*0.02 ,),
                      Text("Supports: PNG, JPG, JPEG, WEBP",style: TextStyle(color: Colors.grey,fontSize: w*0.03),)
                    ],
                  )),
            ),
            Padding(
              padding:  EdgeInsets.all(w*0.04),
              child: TextFormField(

                decoration: InputDecoration(
                  label:
                  Text("Title"),


                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConst.PrimaryColor,width: w*0.002),
                    borderRadius: BorderRadius.circular(w*0.04),


                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.04),
                      borderSide: BorderSide(
                        color: ColorConst.PrimaryColor,
                      )),
                  hintText: ("Title"),

                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpPage(),
                    ));
              },
            child:
            Container(
              height: w * 0.13,
              width: w * 0.7,
              decoration: BoxDecoration(
                  color: ColorConst.white,
                  borderRadius: BorderRadius.circular(w * 0.03),
                  border: Border.all(
                      color: ColorConst.PrimaryColor, width: w * 0.005)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Upload Banner",
                    style: TextStyle(
                        color: ColorConst.PrimaryColor,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            ),
            Container(
              height: w*1,
              width: w*1,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.all(w*0.03,),
                      child: Container(
                          height: w * 0.25,
                          width: w * 0.33,
                          decoration: BoxDecoration(
                              boxShadow:[ BoxShadow(
                                blurStyle: BlurStyle.normal,
                                color: Colors.black.withOpacity(0.20),
                                offset: Offset(0, 2),
                                spreadRadius: 4,
                                blurRadius: 9,
                              )],
                              borderRadius: BorderRadius.circular(w*0.04),
                              color: ColorConst.white
                          ),
                          child: Center(
                            child: ListTile(
                                leading: Image.asset(banner[index]["image"]
                                ),
                                title: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      banner[index]["text1"],
                                      style: TextStyle(
                                          fontSize: w * 0.04,
                                          fontWeight: FontWeight.w500,color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      banner[index]["text2"],
                                      style: TextStyle(fontSize: w * 0.03,color: ColorConst.Black),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          showCupertinoModalPopup(context: context, builder: (context) {
                                            return CupertinoAlertDialog(
                                              title: Text("Are you sure\nYou want to delete User"),
                                              actions: [
                                                Column(
                                                  children: [
                                                    CupertinoDialogAction(child: Text("yes",style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.red),)),
                                                    Divider(),
                                                    CupertinoDialogAction(child: Text("cancel",style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w500),)
                                                      ,onPressed: () {
                                                        Navigator.pop(context);
                                                      },),

                                                  ],
                                                )
                                              ],
                                            );
                                          },);
                                        },
                                        child: SvgPicture.asset(banner[index]["icon"],color: Colors.red,)),

                                  ],
                                )),
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: w * 0.0001,

                    );
                  },
                  itemCount: banner.length),
            ),
          ],
        ),
      ),

    );
  }
}
