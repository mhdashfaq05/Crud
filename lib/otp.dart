import 'package:crud/home_Page1.dart';
import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: w*0.05,
                width: w*0.05,
                //color: Colors.blueGrey,
                child: Center(child: SvgPicture.asset(ImageConst.Shape,))),
          ),
        ),
        backgroundColor: ColorConst.white,
        title: Text("Verify OTP",
            style: TextStyle(
              color: ColorConst.Black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            )), // TextStyle, Text
      ),
      body: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(ImageConst.Otppageimg),
              SizedBox(height: w*0.02,),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("OTP has been sent to "),

                  Text("*****634",style: TextStyle(color: ColorConst.PrimaryColor,fontWeight: FontWeight.w600),),
                   SvgPicture.asset(ImageConst.editpen)
                ],
              )
            ],
          ),
          Container(
            child: FractionallySizedBox(
              child: Pinput(
                closeKeyboardWhenCompleted: true,
                length: 6,
                disabledPinTheme: PinTheme(
                  constraints: BoxConstraints(
                    maxHeight: w*0.3,
                    maxWidth: w*0.2
                  ),
                  decoration: BoxDecoration(color: ColorConst.lightGrey,
                  borderRadius: BorderRadius.circular(w*0.04)
                  )
                ),
              ),
            ),
          ),

          Column(
            children: [
              InkWell( onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage1(),
                )
                );
              },
                child: Container(
                  height: w * 0.13,
                  width: w * 0.7,
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(w * 0.06),
                      border: Border.all(color: ColorConst.PrimaryColor)

                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [


                      Text("Verify", style: TextStyle(
                          color: ColorConst.PrimaryColor,
                          fontWeight: FontWeight.w600
                      ),),
                    ],
                  ),

                ),
              ),
              SizedBox(height: w*0.04,),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Haven't got the confirmation code yet? "),
                  Text("Resend",style: TextStyle(color: ColorConst.PrimaryColor,fontWeight: FontWeight.w600),)
                ],
              )
            ],
          ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Try Another "),
              Text("Method?",style: TextStyle(fontWeight: FontWeight.w600,color: ColorConst.PrimaryColor),)
            ],
          )
        ],
      ),
    );
  }
}
