import 'package:core_libs/dependency_injection/get_it.dart';
import 'package:product/features/home/domain/services/product_service.dart';
import 'package:product/features/home/data/repository/product_repository.dart';
import '../../features/home/domain/ports/product/repository.dart';
import '../../features/home/domain/ports/product/services.dart';

void registerProductServices(){
  getIt.registerSingleton<IProductRepository>(ProductRepository());
  getIt.registerSingleton<IProductService>(ProductService());
}