import 'package:core_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:product/features/home/presentation/widget/product_card.dart';
import 'package:product/features/home/domain/entities/product.dart';

typedef OnSelectProduct = Function(ProductToDisplay productToDisplay);

class ProductList extends ConsumerWidget {
  final List<ProductToDisplay> productList;

  const ProductList({super.key, required this.productList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVMNotifier = ref.read(homeViewModelProvider.notifier);
    final themeProvider = ref.watch(appThemeProvider).themeColor;

    return Container(
      color: themeProvider.backgroundPrimary,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(key: UniqueKey(),
              product: productList[index],
              onTap: (product) => homeVMNotifier.onSelectProduct(context, product),);
          }),
        ),
      );
  }
}
