import 'package:core_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product/features/home/domain/entities/product.dart';
import 'package:product/features/home/presentation/widget/products_list.dart';
import 'package:core_ui/widget/elements/texts/text_title.dart';

class Catalog extends ConsumerWidget {
  final String title;
  final List<ProductToDisplay> products;

  const Catalog({super.key, required this.title, required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(appThemeProvider).themeColor;
    return Column(
      children: [
        Container(
          color: themeProvider.backgroundPrimary,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 8.0, bottom: 10.0),
            child: TextTitle(title: title, color: themeProvider.text,),
          ),
        ),
        Container(
            color: Colors.white,
            child: ProductList(productList: products))
      ],
    );
  }
}
