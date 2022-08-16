import 'package:ecom/models/product_model.dart';
import 'package:get/get.dart';

class AddCart extends GetxController {
  var _products = {}.obs;

  void addProducts(ProductModel productModel) {
    if (_products.containsKey(productModel)) {
      _products[productModel] += 1;
    } else {
      _products[productModel] = 1;
    }
    Get.snackbar(
        'Product Added', "You have added ${productModel.title} to the cart",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 1));
  }

  get products => _products;

  void removeProduct(ProductModel product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => products);
    } else {
      _products[product] -= 1;
    }
  }

  get mytotal => _products.entries.map((e) => e.key.id * e.value).toList();

  get subtotal => _products.entries.map((e) => e.key.id * e.value).toList().reduce((value, element) => value +element);

}
