import 'package:ecom/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var cart = <CartModel>[].obs;

  sumCart(){
    return cart.map((element) => element.id).reduce((value, element) => value!+element!);
  }
  shippingFree(){
    return sumCart() ! *2;
  }
}