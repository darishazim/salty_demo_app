import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:salty_project/model/UserModel.dart';

class UserService{
  final _dio = Dio();
  final url = "https://reqres.in/api/users?page=2";

  Future<List<UserModel>> getUserData() async {
    try{
      var response = await _dio.get(url);
      print(response.data.toString());
      return userModelFromJson(jsonEncode(response.data["data"]));
    }catch(error, stacktrace){
      print("Exception: $error");
      throw "Exception: $error";
    }
  }
}