import 'package:salty_project/service/LoginService.dart';

class LoginRepository{
  Future<bool> login(String email, String password) async {
    // await Future.delayed(const Duration(seconds: 1));
    try{
      if(password=="cityslicka"){
        return LoginService().loginUser(email, password);
      }else{
       throw "Password Salah";
      }
    }catch(e){
      throw e.toString();
    }
  }
}