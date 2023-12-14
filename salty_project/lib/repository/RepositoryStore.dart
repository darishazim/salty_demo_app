import 'package:salty_project/repository/HomeRepository.dart';
import 'package:salty_project/repository/LoginRepository.dart';

class RepositoryStore{
  static final LoginRepository loginRepository = LoginRepository();
  static final HomeRepository homeRepository = HomeRepository();
}