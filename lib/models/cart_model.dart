import 'package:ecom/models/product_model.dart';

class CartModel extends ProductModel{
  int quantity = 0;

  CartModel({id,title,description,category,image,required this.quantity}):
      super(
        id: id,
        title:title,
        description: description,
        category: category,
        image: image
      );

  factory CartModel.fromJson(Map<String,dynamic> json){
    final product = ProductModel.fromJson(json);
    final quantity = json['quantity'];
    return CartModel(
      id: product.id,
      title: product.title,
      description: product.description,
      category: product.category,
      image: product.image,
      quantity: quantity
    );
  }
}