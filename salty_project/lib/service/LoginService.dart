
import 'package:dio/dio.dart';

class LoginService{
  final _dio = Dio();
  final url = "https://reqres.in/api/login";

  Future<bool> loginUser(String email, String password) async {
    try{
      var response = await _dio.post(
        url,
        // data: {'email': "eve.holt@reqres.in", 'password':"cityslicka"},
        data: {'email': email, 'password':password},
      );
      if(response.statusCode == 200){
        print(response.data.toString());
        return true;
      }else{
        return false;
      }
    }catch(error, stacktrace){
      print("Exception: $error");
      throw "Exception: $error";
    }
  }
}