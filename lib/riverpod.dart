import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/imageconst.dart';
import 'package:flutter/material.dart';

import 'colorconst.dart';
import 'main.dart';

class RiverPod extends StatefulWidget {
  const RiverPod({super.key});

  @override
  State<RiverPod> createState() => _RiverPodState();
}

int count = 0;
List Items = [
  {
    "image1": ImageConst.orangejuice,
    "text1": "Orange Juice",
    "text2": 49,
    "qyt": 0
  },
  {
    "image1": ImageConst.grapejuice,
    "text1": "Grape Juice",
    "text2": 49,
    "qyt": 0
  },
  {
    "image1": ImageConst.guvajuice,
    "text1": "Guva Juice",
    "text2": 59,
    "qyt": 0
  },
  {
    "image1": ImageConst.bananajuice,
    "text1": "Banana Juice",
    "text2": 39,
    "qyt": 0
  }
];
int total = 0;

class _RiverPodState extends State<RiverPod> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? getCollection;

  totalprice() {
    total = 0;
    for (int i = 0; i < getCollection!.length; i++) {
      total = getCollection![i]["qyt"] * getCollection![i]["text2"] + total;
      setState(() {});
    }
  }

  getdata() async {
    await
    FirebaseFirestore.instance.collection("getorders").snapshots().listen((event) {
      getCollection = event.docs;
      print(event.docs);
    });

  }

  adddata() {
    for (var data in Items) {
      FirebaseFirestore.instance.collection("getorders").add(data);
    }
  }

  @override
  void initState() {
    getdata();
    //adddata();

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: w * 0.12,
          width: w * 1,
          decoration: BoxDecoration(
              color: ColorConst.PrimaryColor,
              borderRadius: BorderRadius.circular(w * 0.03)),
          child: Center(
            child: Text(
              "Total price : ₹$total",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: w * 0.04,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
//backgroundColor: Colors.blue,
        appBar: AppBar(
          //elevation: 0,
          backgroundColor: ColorConst.white,

          title: Text(
            "Food Order",
            style:
                TextStyle(fontWeight: FontWeight.w600, color: ColorConst.Black),
          ),
          actions: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(w * 0.02),
                  child:
                      Icon(Icons.shopping_cart_outlined, color: Colors.black),
                  // child:
                  // Text(
                  //   "Total price : ₹$total",
                  //   style: TextStyle(color: Colors.green, fontSize: w * 0.05),
                  // ),
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              //Padding(padding: EdgeInsets.all(w * 0.02), child: Text("Items", style: TextStyle(fontSize: w * 0.04)),),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("getorders").snapshots(),
                builder: (context, snapshot) {
                  var data = snapshot.data!.docs;
                  return Container(
                      height: w * 1.826,
                      width: w * 1,
                      //color: Colors.red,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: w * 0.35,
                                  width: w * 0.98,
                                  // color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: w * 0.3,
                                        width: w * 0.40,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    data[index]["image1"]),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(w * 0.04)),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(w * 0.03),
                                            child: Text(data[index]["text1"],
                                                style: TextStyle(
                                                    fontSize: w * 0.04,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                ImageConst.fourstarrating,
                                                width: w * 0.20,
                                              ),
                                              SizedBox(
                                                height: w * 0.03,
                                              ),
                                              Text(
                                                data[index]["text2"].toString(),
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      data[index]["qyt"] != 0
                                          ? Container(
                                              height: w * 0.11,
                                              width: w * 0.22,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        w * 0.03),
                                                color: Colors.black,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      FirebaseFirestore.instance
                                                          .collection("getorders")
                                                          .doc(data[index].id)
                                                          .update( {
                                                        "qyt":data[index]["qyt"]-1
                                                      });
                                                      totalprice();

                                                      setState(() {});
                                                    },
                                                    child: CircleAvatar(
                                                      radius: w * 0.03,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      child: Icon(Icons.remove),
                                                    ),
                                                  ),
                                                  Text(
                                                      data[index]["qyt"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  InkWell(
                                                    onTap: () {
                                                      FirebaseFirestore.instance
                                                          .collection("getorders")
                                                          .doc(data[index].id)
                                                          .update( {
                                                        "qyt":data[index]["qyt"]+1
                                                      });

                                                      totalprice();

                                                      setState(() {});
                                                    },
                                                    child: CircleAvatar(
                                                      radius: w * 0.03,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                FirebaseFirestore.instance
                                                    .collection("getorders")
                                                    .doc(data[index].id)
                                                    .update(
                                                  {
                                                 "qyt":data[index]["qyt"]+1
                                                  }
                                                        );
                                                 totalprice();
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: w * 0.11,
                                                width: w * 0.22,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          w * 0.03),
                                                  color: Colors.black,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Add Item",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ))
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox();
                          },
                          itemCount: Items.length));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
