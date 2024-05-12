import 'package:core_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/product.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductToDisplay product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(appThemeProvider).themeColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.product.category).toUpperCase(),
          style: TextStyle(color: themeProvider.text),
        ),
        backgroundColor: themeProvider.backgroundPrimary,
        leading: IconButton(
            onPressed: context.pop,
            icon: Icon(
              Icons.chevron_left,
              color: themeProvider.text,
            )),
      ),
      body: SafeArea(
          child: Container(
            color: themeProvider.backgroundPrimary,
            child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                      height: 350,
                      child: Hero(
                        tag: widget.product.imageUrl,
                        child: Image.network(
                          widget.product.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(Radius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.product.category.toUpperCase(),
                          style: const TextStyle(),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(widget.product.desciption!),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
                    ),
                  ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 370,
        height: 60,
        child: FloatingActionButton(
          heroTag: 'buy_now',
          backgroundColor: Colors.black,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.product.price} \$",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const Row(
                  children: [
                    Text(
                      'Buy Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_right,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
