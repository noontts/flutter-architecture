import 'package:get_it/get_it.dart';

import '../network/http/dio_service.dart';
import '../network/http/http_service.dart';

final getIt = GetIt.instance;

void registerCoreServices() {
  getIt.registerSingleton<HttpService>(DioService("https://fakestoreapi.com"));
}
