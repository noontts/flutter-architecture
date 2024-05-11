import 'package:core_libs/dependency_injection/get_it.dart';
import '../ports/product/repository.dart';
import '../ports/product/services.dart';
import '../entities/product.dart';

class ProductService extends IProductService {
  final IProductRepository repository = getIt.get<IProductRepository>();

  @override
  Future<List<ProductToDisplay>> getByCategory(String category) async {
    final rawProducts = await repository.getByCategory(category);
    return rawProducts
        .map((product) => ProductToDisplay(
            id: product.id.toString(),
            name: product.title!,
            category: product.category!,
            imageUrl: product.image!,
            price: product.price!.toDouble(),
            desciption: product.description!))
        .toList();
  }

  @override
  Future<List<String>> getCategories() {
    return repository.getCategories();
  }
}
