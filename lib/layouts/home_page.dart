import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:ecom/controllers/addcart_controller.dart';
import 'package:ecom/controllers/cart_controller.dart';
import 'package:ecom/controllers/product_controller.dart';
import 'package:ecom/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'cart_products.dart';

class MyHomePage extends StatelessWidget {
  final productController = Get.put(ProductController());
  final addcartController = Get.put(AddCart());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(()=> FloatingActionButton(
        onPressed: () {
          Get.to(()=> CartProduct());
        },
        child: Badge(
          badgeContent: Text(addcartController.products.length !=null?
          addcartController.products.length.toString():"9"),
          child: Icon(Icons.shopping_bag),
        ),
      )),
      appBar: AppBar(),
      body: Obx(() => productController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: productController.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (300 / 370),
                  crossAxisCount: 2,
                  mainAxisSpacing: 5),
              itemBuilder: (_, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: Container(
                    height: 300,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.network(
                              productController.productList[index].image
                                  .toString(),
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.fill),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(productController.productList[index].title
                            .toString()
                            .substring(0, 15)),
                        Text(productController.productList[index].category
                            .toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text('View')),
                            ElevatedButton(
                               onPressed: (){
                                 addcartController.addProducts(productController.productList[index]);
                               },
                                child: Text('Cart'))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }

  bool isExistInCart(RxList<CartModel> cart, CartModel item) {
    print(item.id);
    return cart.contains(item);
    print(item);
  }
}
