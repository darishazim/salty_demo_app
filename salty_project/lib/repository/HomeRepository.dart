import '../model/UserModel.dart';
import '../service/UserService.dart';

class HomeRepository{
  Future<List<UserModel>> getUserData() async {
    try{
      return await UserService().getUserData();
    }catch(e){
      throw e.toString();
    }
  }
}