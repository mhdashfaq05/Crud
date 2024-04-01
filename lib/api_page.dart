import 'dart:convert';

import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  String link = "https://reqres.in/api/users?page=2";
  Response? a;
  Map<String, dynamic> data = {};
  List User = [];

  getData() async {
    // String b="10";
    // int c= int.parse(b);
    a = await http.get(Uri.tryParse(link)!);
    print(a!.statusCode);
    // print(a!.body);

    data = json.decode(a!.body);
    // print(data);
    if (a != null) {
      User = data["data"];
      print(User);
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  TextEditingController name = TextEditingController();
  List api = [
    {"text1": "Postoffice : Perinthalmanna", "text2": "Pincode : 679322"},
    {"text1": "Postoffice : Perinthalmanna", "text2": "Pincode : 679322"},
    {"text1": "Postoffice : Perinthalmanna", "text2": "Pincode : 679322"},
    {"text1": "Postoffice : Perinthalmanna", "text2": "Pincode : 679322"},
    {"text1": "Postoffice : Perinthalmanna", "text2": "Pincode : 679322"},
    {"text1": "Postoffice : Perinthalmanna", "text2": "Pincode : 679322"},
    {"text1": "Postoffice : Perinthalmanna", "text2": "Pincode : 679322"},
    {"text1": "Postoffice : Perinthalmanna", "text2": "Pincode : 679322"},
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
              height: w * 0.05,
              width: w * 0.05,
              //color: Colors.blueGrey,
              child: Center(
                  child: SvgPicture.asset(
                ImageConst.Shape,
              ))),
        ),
        title: Text(
          "Postal Codes",
          style:
              TextStyle(fontWeight: FontWeight.w800, color: ColorConst.Black),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: Container(
                    width: w * 0.9,
                    height: w * 0.1,
                    decoration: BoxDecoration(
                      //  border: Border.all(color: Colorconst.primarycolor),
                      borderRadius: BorderRadius.circular(w * 0.04),
                      color: ColorConst.lightGrey,
                    ),
                    child: TextFormField(
                        controller: name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          label: Text(
                            "Enter pincode",
                            style: TextStyle(
                                color: Colors.grey, fontSize: w * 0.05),
                          ),
                          //focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                          // enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                        )),
                  ),
                ),
              ],
            ),
            Container(
              height: w * 2.2,

              width: w * 1,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(
                        w * 0.03,
                      ),
                      child: Container(
                          height: w * 0.2,
                          width: w * 0.33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w * 0.04),
                              color: ColorConst.lightGrey),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: w * 0.03,
                                left: w * 0.04,
                                bottom: w * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ID : ${User[index]["id"].toString()}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: w * 0.04),),
                                Text("NAME : ${User[index]["first_name"]} ${User[index]["last_name"]}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: w * 0.04),),
                                Text("EMAIL : ${User[index]["email"].toString()}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: w * 0.04),)
                              ],
                            ),
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: w * 0.0001,
                    );
                  },
                  itemCount: User.length),
            ),
          ],
        ),
      ),
    );
  }
}
