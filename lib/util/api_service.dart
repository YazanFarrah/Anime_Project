import 'dart:developer';

import 'package:fbanime/util/api_constants.dart';
import 'package:http/http.dart' as http;

import '../models/userModel.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model =
            userModelFromJson(response.body) as List<UserModel>;
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
