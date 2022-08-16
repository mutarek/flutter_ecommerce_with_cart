import 'package:ecom/controllers/addcart_controller.dart';
import 'package:ecom/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProduct extends StatelessWidget {
  final AddCart cartController = Get.find();
  late final ProductModel productModel;
  late final int quantity;

  CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() => Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 75, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${cartController.subtotal} Tk',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: (){

                    }, child: Text('CheckOut')),
                Expanded(
                  child: ListView.builder(
                      itemCount: cartController.products.length,
                      itemBuilder: (_, index) {
                        return cartProductsCard(
                          cartController: cartController,
                          productModel:
                              cartController.products.keys.toList()[index],
                          quantity:
                              cartController.products.values.toList()[index],
                          index: index,
                        );
                      }),
                )
              ],
            )));
  }
}

class cartProductsCard extends StatelessWidget {
  final AddCart cartController;
  final ProductModel productModel;
  final int quantity;
  final int index;

  cartProductsCard(
      {Key? key,
      required this.cartController,
      required this.productModel,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                productModel.image.toString(),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
                child: Text(productModel.title.toString().substring(0, 15))),
            IconButton(
                onPressed: () {
                  cartController.removeProduct(productModel);
                },
                icon: Icon(Icons.remove_circle)),
            Text('${quantity}'),
            IconButton(
                onPressed: () {
                  cartController.addProducts(productModel);
                },
                icon: Icon(Icons.add_circle)),
          ],
        ));
  }
}
