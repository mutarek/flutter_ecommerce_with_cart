import 'package:flutter/material.dart';

class CartTotal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total'),
          Text('Total'),
        ],
      ),
    );
  }
}