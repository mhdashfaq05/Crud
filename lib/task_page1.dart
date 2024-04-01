import 'package:crud/task_page2.dart';
import 'package:flutter/material.dart';

import 'colorconst.dart';
import 'main.dart';

class Task_Page1 extends StatefulWidget {
  const Task_Page1({super.key});

  @override
  State<Task_Page1> createState() => _Task_Page1State();
}

class _Task_Page1State extends State<Task_Page1> {
  var products = [];
  String? dropdownvalue;
  TextEditingController Product_Controller = TextEditingController();
  TextEditingController Price_Controller = TextEditingController();
  TextEditingController Qty_Controller = TextEditingController();
  Products(){

  }
  List c = [
    "Veg",
    "Fruits",
    "Groceries",
  ];

  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    void submitProduct() {
      setState(() {
        String productName = Product_Controller.text;
        double productPrice =
            double.tryParse(Price_Controller.text) ?? 0.0;
        int productQuantity = int.tryParse(Qty_Controller.text) ?? 0;

        if (productName.isNotEmpty && productPrice > 0 && productQuantity > 0) {

          products.add({

            "name":productName,
            "price":productPrice,
            "quantity":productQuantity,
            "category":dropDownValue,
          });
          print(products);
          dropdownvalue='';

          Product_Controller.clear();
          Price_Controller.clear();
          Qty_Controller.clear();

          if (
          products.length > 4
          ) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Task_Page2(a: products,)
                ));
          }

        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.PrimaryColor,
        title: Text("Add Product",
            style: TextStyle(
              color: ColorConst.white,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            )),
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(w * 0.02),
                child:
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Task_Page2(a: [],),));
                    },
                    child: Icon(Icons.shopping_cart_outlined, color: Colors.black)),

              ),
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(

                controller: Product_Controller,
                textCapitalization: TextCapitalization.words,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConst.lightGrey,
                  border: InputBorder.none,
                  hintText: "Product name",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: ColorConst.lightGrey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: ColorConst.lightGrey)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: Price_Controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConst.lightGrey,
                  border: InputBorder.none,
                  hintText: "Product price",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: ColorConst.lightGrey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: ColorConst.lightGrey)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: Qty_Controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConst.lightGrey,
                  border: InputBorder.none,
                  hintText: "Product Quantity",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: ColorConst.lightGrey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: ColorConst.lightGrey)),
                )),
          ),
          DropdownButton(
            hint: Text("Selected items: "),
            icon: Icon(Icons.arrow_drop_down_circle),
            isExpanded: true,
            style: TextStyle(color: Colors.black, fontSize: w * 0.045),
            value: dropDownValue,
            items: c.map((valueItem) {
              return DropdownMenuItem(
                  value: valueItem, child: Text(valueItem));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                dropDownValue = newValue.toString();
              });
            },
          ),
          InkWell(
    onTap: () {
    submitProduct();
    setState(() {

    });
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
                    "Submit",
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

    );
  }

}
