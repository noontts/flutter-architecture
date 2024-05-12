import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:product/features/home/domain/ports/product/services.dart';
import 'package:product/features/home/presentation/viewmodels/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/product.dart';
part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {

  IProductService service = getIt.get<IProductService>();

  @override
  HomeState build() => HomeState(
      loading: false,
      products: [],
      categories: []
  );

  void getProducts() async {
    state = state.copyWith(
      loading: true
    );

    final categories = await service.getCategories();
    final productFetchers = categories.map((e) => service.getByCategory(e));
    final products = await Future.wait(productFetchers);

    state = state.copyWith(
      loading: false,
      products: products,
      categories: categories
    );
  }

  void onSelectProduct(BuildContext context, ProductToDisplay product) {
    context.go('/detail', extra: product);
  }
}
