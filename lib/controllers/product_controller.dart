import 'dart:convert';

import 'package:ecom/models/cart_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/secret/api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  var cartModel = <CartModel>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    getAllProducts();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String cartSave = box.read('cart');
      if(cartSave.length != 0 && cartSave.isNotEmpty)
        {
          final listCart = jsonDecode(cartSave) as List<dynamic>;
          final listCartParsed = listCart.map((e) => CartModel.fromJson((e))).toList();
          if(listCartParsed.length > 0) cartModel.value = listCartParsed;
        }
    });
    super.onInit();
  }

  void getAllProducts() async{
    var data = await ApiService().fetchProduct();
    if(data.length>0)
    {
      productList.clear();
      productList.addAll(data);
      print(productList.length);
      isLoading(false);
    }
  }
}