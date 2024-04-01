import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intrview_task/cart.dart';
// import 'package:intrview_task/list_Product.dart';

import 'main.dart';

class New_Task2 extends StatefulWidget {
  const New_Task2({super.key});

  @override
  State<New_Task2> createState() => _New_Task2State();
}


class _New_Task2State extends State<New_Task2> {

  List<Map<String, dynamic>> products = [];

  String? dropdownvalue;
  var listItems = [
    "Vegitables",
    "Fruits",
    "Grossory",
  ];


  TextEditingController ProductName_Controller = TextEditingController();
  TextEditingController ProductPrice_Controller = TextEditingController();
  TextEditingController ProductQnty_Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    void submitProduct() {
      setState(() {
        String productName = ProductName_Controller.text;
        double productPrice =
            double.tryParse(ProductPrice_Controller.text) ?? 0.0;
        int productQuantity = int.tryParse(ProductQnty_Controller.text) ?? 0;

        if (productName.isNotEmpty && productPrice > 0 && productQuantity > 0) {

          products.add({

            "name":productName,
            "price":productPrice,
            "quantity":productQuantity,
            "category":dropdownvalue,
          });
          print(products);
          dropdownvalue='';

          ProductName_Controller.clear();
          ProductPrice_Controller.clear();
          ProductQnty_Controller.clear();

          if (
          products.length > 4
          ) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => listProduct(a: products,

                    )
                ));
          }

        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            "Products",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.blue),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            TextFormField(
              controller: ProductName_Controller,
              // textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: w * 0.04),
              decoration: InputDecoration(
                  fillColor: Colors.cyanAccent,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  labelText: "Product Item",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: w * 0.04,
                      color: Colors.black.withOpacity(0.4)),
                  hintText: "please enter product item",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: w * 0.04),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            TextFormField(
              controller: ProductPrice_Controller,
              // textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: w * 0.04),
              decoration: InputDecoration(
                  fillColor: Colors.cyanAccent,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.price_change,
                    color: Colors.white,
                  ),
                  labelText: "Product Price",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: w * 0.04,
                      color: Colors.black.withOpacity(0.4)),
                  hintText: "please enter product price",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: w * 0.04),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            TextFormField(
              controller: ProductQnty_Controller,
              // textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: w * 0.04),
              decoration: InputDecoration(
                  fillColor: Colors.cyanAccent,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.price_change,
                    color: Colors.white,
                  ),
                  labelText: "Product Qnty",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: w * 0.04,
                      color: Colors.black.withOpacity(0.4)),
                  hintText: "please enter product Qnty",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: w * 0.04),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            Container(
              padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * 0.025),
                  border: Border.all(
                    color: Colors.grey.shade400,
                  )),
              child: DropdownButton(
                hint: Text("Selected items: "),
                icon: Icon(Icons.arrow_drop_down_circle),
                isExpanded: true,
                style: TextStyle(color: Colors.black, fontSize: w * 0.045),
                value: dropdownvalue,
                items: listItems.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem, child: Text(valueItem));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                  });
                },
              ),
            ),
            InkWell(
              onTap: () {
                submitProduct();

              },
              child: Container(
                height: w * 0.12,
                width: w * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * 0.06),
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: w * 0.007)),
                child: Center(
                  child: Text("Submitt",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.043,
                          color: Colors.blue)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  listProduct({required List<Map<String, dynamic>> a}) {}
}