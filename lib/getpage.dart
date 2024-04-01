import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'colorconst.dart';
import 'main.dart';

class GetPage extends StatefulWidget {
  final String id;
  const GetPage({super.key, required this.id});

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  List getcollection = [];
  Map<String, dynamic> getdocument = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    QuerySnapshot<Map<String, dynamic>> getdata =
                        await FirebaseFirestore.instance
                            .collection("users")
                            .get();
                    getcollection = getdata.docs;

                    DocumentSnapshot<Map<String, dynamic>> docdata =
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(widget.id)
                            .get();
                    getdocument = docdata.data()!;

                    setState(() {});
                  },
                  child: Container(
                    height: w * 0.12,
                    width: w * 0.3,
                    decoration: BoxDecoration(
                        color: ColorConst.white,
                        borderRadius: BorderRadius.circular(w * 0.06),
                        border: Border.all(
                            color: ColorConst.PrimaryColor, width: w * 0.005)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get",
                          style: TextStyle(
                              color: ColorConst.PrimaryColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: w * 0.2,
              width: w * 1,
              color: Colors.lightGreenAccent,
              child: Column(
                children: [
                  Text(getdocument["name"] ?? ""),
                  Text(getdocument["email"] ?? ""),
                ],
              ),
            ),
            SizedBox(
              height: w * 1.2,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getcollection[index]["name"]),
                            Text(getcollection[index]["email"]),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: w * 0.0001,
                    );
                  },
                  itemCount: getcollection.length),
            ),
          ],
        ),
      ),
    );
  }
}
