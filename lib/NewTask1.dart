import 'package:flutter/material.dart';
//import 'package:intrview_task/Prodects.dart';

import 'main.dart';

class New_Task1 extends StatefulWidget {
  const New_Task1(
      {super.key, required this.a,
      });
  final List a;

  @override
  State<New_Task1> createState() => _New_Task1State();
}

class _New_Task1State extends State<New_Task1> {
  int selectIndex = 0;
  String selectCatogery = "";
  List category1 = ["All", "Vegitables", "Fruits", "Grossory"];
  List getProducts() {
    if (selectIndex == 0) {
      return widget.a;
    } else {
      return widget.a.where((product) => product["category"] == category1[selectIndex]).toList();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            "List Products",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.blue),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: w * 0.15,
                width: w * 1,
                child: ListView.builder(
                  itemCount: category1.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        print(widget.a);
                        selectIndex = index;
                        setState(() {});
                      },
                      child: Container(
                          height: w * 0.1,
                          // width: width*0.35,
                          // color: Colors.red,
                          padding: EdgeInsets.only(
                              left: w * 0.02,
                              right: w * 0.02),
                          margin: EdgeInsets.all(w * 0.02),
                          decoration: BoxDecoration(
                              color: selectIndex == index
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                  color: Colors.green),
                              borderRadius: BorderRadius.circular(
                                  w * 0.05)),
                          child: Center(
                              child: Text(

                                category1[index],
                                style: TextStyle(
                                    color: selectIndex == index
                                        ? Colors.white
                                        : Colors.green),
                              )
                          )
                      ),
                    );
                  },
                )
            ),
            SizedBox(
              height: w * 2,
              width: w * 1,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount:  getProducts().length,
                itemBuilder: (BuildContext context, int index) {
                  final List products = getProducts();
                  return Container(
                    height: w * 0.3,
                    width: w * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: ListTile(
                      leading:
                      // CircleAvatar(
                      //   radius: w*0.10,
                      //   backgroundImage: FileImage(widget.a[index]['image']),
                      // ),
                      Container(
                        height: w * 0.2,
                        width: w * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w * 0.03),
                          color: Colors.redAccent,
                        ),
                        child: Image(image: FileImage(products[index]['image']),
                          fit: BoxFit.fill,),
                      ),
                      title: Text(products[index]['name'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: w * 0.04)),
                      subtitle: Text(products[index]['price'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: w * 0.04)),
                      trailing:
                      Text(products[index]['quantity'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: w * 0.04)
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: w * 0.02,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}