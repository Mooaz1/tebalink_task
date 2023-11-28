import 'package:tebalink_task/data/repository/login_repository.dart';

import '../entites/login.dart';

class UserLoginCase{
  final BaseLoginRepository _baseLoginRepository;

  UserLoginCase(this._baseLoginRepository);

  excute({
    required Login login
  })async{
  return  await _baseLoginRepository.login(login: login);
  }
  
}