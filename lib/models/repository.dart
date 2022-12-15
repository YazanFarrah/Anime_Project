import 'package:http/http.dart' as http;

abstract class Repository {
  //get
  Future<http.Response> get(final url, {final query});
  //patch
  // Future<http.Response> patch(Todo todo);
  // //put
  // Future<http.Response> put(Todo todo);
  //delete
  Future<http.Response> delete(final url, {final query});
  // //post
  // Future<http.Response> post(Todo todo);
  Future<http.Response> post(final url);
}
