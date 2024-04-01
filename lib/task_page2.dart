
import 'package:crud/colorconst.dart';
import 'package:crud/imageconst.dart';
import 'package:flutter/material.dart';


import 'main.dart';

class Task_Page2 extends StatefulWidget {
  final List a;

  const Task_Page2({super.key, required this.a});

  @override
  State<Task_Page2> createState() => _Task_Page2State();
}

class _Task_Page2State extends State<Task_Page2> {
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
        backgroundColor: ColorConst.PrimaryColor,
        title: Text(
          "Items",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
                                  ? ColorConst.PrimaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color:ColorConst.PrimaryColor),
                              borderRadius: BorderRadius.circular(
                                  w * 0.05)),
                          child: Center(
                              child: Text(

                                category1[index],
                                style: TextStyle(
                                    color: selectIndex == index
                                        ? Colors.white
                                        : ColorConst.PrimaryColor),
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
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.normal,
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(0, 4),
                          spreadRadius: 15,
                          blurRadius: 15,
                        )
                      ],
                        borderRadius: BorderRadius.circular(w * 0.03),
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.white38),),
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
                        child: Image.asset(ImageConst.ShopingBag),
                      ),
                      title: Text(products[index]['name'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: w * 0.04)),
                      subtitle:

                      Text(products[index]['price'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: w * 0.04)),
                      trailing:
                      Text(products[index]['quantity'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
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
    //   SafeArea(
    //
    //   child: DefaultTabController(
    //     length: 5,
    //     child: Scaffold(
    //       body: Padding(
    //         padding:  EdgeInsets.only(left:w*0.03,right: w*0.03),
    //         child: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Text("Items",style:TextStyle(
    //                     fontSize: 24,
    //                     fontWeight: FontWeight.w700
    //                 ),),
    //               ],
    //             ),
    //             SizedBox(height: w*0.02,),
    //
    //             Container(
    //               width: w*2,
    //               height: w*0.1,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(w*0.03),
    //                   color: ColorConst.PrimaryColor
    //               ),
    //               child: TabBar(
    //
    //                   indicatorColor: Colors.white,
    //                   tabs: [
    //                     Tab(child: Text("All",style: TextStyle(fontSize: w*0.03),),),
    //                     // Tab(child: Text("Veg",style: TextStyle(fontSize: w*0.03),),),
    //                     // Tab(child: Text("Fruit",style: TextStyle(fontSize: w*0.03),),),
    //                     // Tab(child: Text("Groceries",style: TextStyle(fontSize: w*0.03),),),
    //
    //
    //                   ]),
    //             ),
    //             Expanded(
    //                 child: TabBarView(
    //                     children: [
    //                       All_Product(MyProduct:[]),
    //                       All_Product(MyProduct: [],),
    //                       All_Product(MyProduct: [],),
    //                       All_Product(MyProduct: [],),
    //                     ]))
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
