import 'package:go_router/go_router.dart';
import 'package:product/features/home/presentation/screen/home_screen.dart';
import 'package:product/features/home/presentation/screen/product_detail_screen.dart';
import '../../features/home/domain/entities/product.dart';

final productRoutes = [
  GoRoute(
    path: 'detail',
    builder: (context, state) {
      final product = state.extra as ProductToDisplay;
      return ProductDetailScreen(
        product: product,
      );
    },
  )
];

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const MyHomePage();
      },
      routes: productRoutes)
]);
