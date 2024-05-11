import 'package:core_libs/network/http/http_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:product/features/home/data/repository/product_repository.dart';
import 'package:product/features/home/domain/ports/product/repository.dart';
import 'package:product/features/home/domain/ports/product/services.dart';
import 'package:product/features/home/domain/services/product_service.dart';
import 'mocks/mock_http_service.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<HttpService>(MockHttpService("https://fakestoreapi.com"));
  getIt.registerSingleton<IProductRepository>(ProductRepository());
  getIt.registerSingleton<IProductService>(ProductService());

  test('Get product by electronics category returns electronics products',
      () async {
    final mockHttpService = getIt.get<HttpService>();
    (mockHttpService as MockHttpService).data = [
      {
        "id": 9,
        "title": "WD 2TB Elements Portable External Hard Drive - USB 3.0 ",
        "price": 64,
        "description":
            "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
        "rating": {"rate": 3.3, "count": 203}
      }
    ];

    final productService = getIt.get<IProductService>();
    final products = await productService.getByCategory('electronics');

    expect(products, isNotNull);
    expect(products[0].category, 'electronics');
  });

  test('Get all categories gets categories', () async {
    final mockHttpService = getIt.get<HttpService>();
    (mockHttpService as MockHttpService).data = [
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing"
    ];

    final productService = getIt.get<IProductService>();
    final products = await productService.getCategories();

    expect(products, isNotNull);
  });
}
