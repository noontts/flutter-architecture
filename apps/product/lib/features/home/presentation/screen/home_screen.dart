import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:core_ui/widget/compound/loading/loading_indicator.dart';
import 'package:core_ui/widget/compound/navbar/home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/product.dart';
import '../../domain/ports/product/services.dart';
import '../widget/catalog.dart';
import '../widget/home_jumbotron.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final IProductService service = getIt.get<IProductService>();

  List<List<ProductToDisplay>> products = [];
  List<String> categories = [];
  bool isLoading = false;

  final Map<String,String> categoryImages = {
    "electronics": 'https://images.unsplash.com/photo-1544006658-89bde88e87c6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    "jewelery":'https://plus.unsplash.com/premium_photo-1661645473770-90d750452fa0?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    "men's clothing":'https://images.unsplash.com/photo-1507680434567-5739c80be1ac?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    "women's clothing": 'https://images.unsplash.com/photo-1532453288672-3a27e9be9efd?q=80&w=2448&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  };

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void onSelectProduct(ProductToDisplay product) {
    context.go("/detail", extra: product);
  }

  void getProducts() async {
    setState(() {
      isLoading = true;
    });
    final categories = await service.getCategories();
    final productFetchers = categories.map((e) => service.getByCategory(e));

    final products = await Future.wait(productFetchers);
    setState(() {
      this.categories = categories;
      this.products = products;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const HomeNavbar(),
          Expanded(
              child: isLoading
                  ? const Loading()
                  : ListView.builder(
                      key: UniqueKey(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            HomeJumbotron(
                                title: categories[index],
                                imageUrl: categoryImages[categories[index]]!),
                            Catalog(
                                title: "All Product",
                                products: products[index],
                                onSelectProduct: onSelectProduct)
                          ],
                        );
                      }))
        ]),
      ),
    );
  }
}
