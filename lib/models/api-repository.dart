import 'package:fbanime/models/repository.dart';
import 'package:http/http.dart' as http;

class APIRepositry implements Repository {
  final _dataUrl = 'https//';

  @override
  Future<http.Response> get(final url, {final query}) {
    return http.get(Uri.parse(_dataUrl + url));
  }

  @override
  Future<http.Response> delete(final url, {final query}) {
    return http.delete(Uri.parse(_dataUrl + url));
  }

  @override
  // edit this (body)
  Future<http.Response> post(final url) {
    return http.post(Uri.parse(_dataUrl + url));
  }
}
