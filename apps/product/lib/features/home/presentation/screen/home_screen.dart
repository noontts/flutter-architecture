import 'package:core_ui/theme/theme_provider.dart';
import 'package:core_ui/widget/compound/loading/loading_indicator.dart';
import 'package:core_ui/widget/compound/navbar/home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product/features/home/presentation/viewmodels/home_view_model.dart';
import '../widget/catalog.dart';
import '../widget/home_jumbotron.dart';

class MyHomePage extends ConsumerStatefulWidget{
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  final Map<String,String> categoryImages = {
    "electronics": 'https://images.unsplash.com/photo-1544006658-89bde88e87c6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    "jewelery":'https://plus.unsplash.com/premium_photo-1661645473770-90d750452fa0?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    "men's clothing":'https://images.unsplash.com/photo-1507680434567-5739c80be1ac?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    "women's clothing": 'https://images.unsplash.com/photo-1532453288672-3a27e9be9efd?q=80&w=2448&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  };

  @override
  void initState() {
    super.initState();
    Future((){
      ref.read(homeViewModelProvider.notifier).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeVM = ref.watch(homeViewModelProvider);
    final color = ref.watch(appThemeProvider).themeColor;

    return Scaffold(
      backgroundColor: color.backgroundPrimary,
      body: SafeArea(
        child: Column(children: [
          const HomeNavbar(),
          Expanded(
              child: homeVM.loading
                  ? const Loading()
                  : ListView.builder(
                      key: UniqueKey(),
                      itemCount: homeVM.categories.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            HomeJumbotron(
                                title: homeVM.categories[index],
                                imageUrl: categoryImages[homeVM.categories[index]]!),
                            Catalog(
                                title: "All Product",
                                products: homeVM.products[index]
                                )
                          ],
                        );
                      }))
        ]),
      ),
    );
  }
}
