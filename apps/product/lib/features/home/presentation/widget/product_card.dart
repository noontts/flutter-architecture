import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:product/features/home/domain/entities/product.dart';
import 'package:product/features/home/presentation/widget/product_info.dart';

typedef ProductCardType = Function(ProductToDisplay product);

class ProductCard extends StatelessWidget {
  final ProductToDisplay product;
  final ProductCardType? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        if (onTap != null) onTap!(product);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        height: 250,
        width: 150,
        child: Stack(
          children: <Widget>[
            Hero(
              tag: product.imageUrl,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.contain,
                height: 250,
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: ProductInfo(
                  name: product.name,
                  price: (product.price).toString(),
                )),
          ],
        ),
      ),
    );
  }
}
