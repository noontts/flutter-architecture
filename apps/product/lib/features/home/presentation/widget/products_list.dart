import 'package:flutter/material.dart';
import 'package:product/features/home/presentation/widget/product_card.dart';
import 'package:product/features/home/domain/entities/product.dart';

typedef OnSelectProduct = Function(ProductToDisplay productToDisplay);

class ProductList extends StatelessWidget {
  final List<ProductToDisplay> productList;
  final OnSelectProduct? onSelectProduct;

  const ProductList({super.key, required this.productList, this.onSelectProduct});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(product: productList[index], onTap: onSelectProduct,);
          }),
        ),
      );
  }
}
