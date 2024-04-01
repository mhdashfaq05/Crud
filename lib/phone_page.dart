import 'package:country_code_picker/country_code_picker.dart';
import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:crud/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  TextEditingController phonenumber = TextEditingController();
  final numberValidation=RegExp(r"\d{10}");
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Enter Phone Number",
            style: TextStyle(
              color: ColorConst.Black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            )), // TextStyle, Text
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [Image.asset(ImageConst.phonepageimg)],
            ),


            Padding(
              padding:  EdgeInsets.all(w*0.03),
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(numberValidation.hasMatch(value!)){
                        return null;
                      }
                      else{
                        return "Enter Valid Number";
                      }
                    },
                     keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    controller: phonenumber,


                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.02),
                          borderSide: BorderSide(
                            color: ColorConst.PrimaryColor,
                          )),
                      label: Text("Mobile Number"),
                      prefixIcon: CountryCodePicker(
                        onChanged: print,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IT',
                        favorite: ['+39','FR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),

                    ),
                  ),
                  SizedBox(height: w*0.09,),
                  InkWell(onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage(),
                    )
                    );
                    setState(() {

                    });
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


                          Text("Send OTP", style: TextStyle(
                              color: ColorConst.PrimaryColor,
                              fontWeight: FontWeight.w600
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign in with",style: TextStyle(color: ColorConst.PrimaryColor),),
                    Text("Another Method ?",style: TextStyle(color: ColorConst.PrimaryColor,fontWeight: FontWeight.w600),)
                  ],
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
