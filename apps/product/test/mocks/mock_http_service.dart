import 'package:core_libs/network/http/http_service.dart';

class MockHttpService extends HttpService {
  dynamic data;
  MockHttpService(super.url);

  @override
  Future delete(String path, data) async {
    return data;
  }

  @override
  Future get(String path) async {
    return data;
  }

  @override
  Future patch(String path, data) async {
    return data;
  }

  @override
  Future post(String path, data) async {
    return data;
  }

  @override
  Future put(String path, data) async {
    return data;
  }
}
