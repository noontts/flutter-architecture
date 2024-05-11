import 'package:flutter/material.dart';
import 'package:core_ui/widget/elements/texts/price_text.dart';
import 'package:core_ui/widget/elements/texts/small_text.dart';

class ProductInfo extends StatelessWidget {
  final String name;
  final String price;
  const ProductInfo({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 80, child: SmallText(title: name)),
            PriceText(title: price, color: Colors.white,)
          ],
        ),
      ),
    ); 
  }
}
