import 'package:tebalink_task/data/datawarehouse/remote/login_data.dart';
import 'package:tebalink_task/domain/entites/login.dart';

abstract class BaseLoginRepository{
  Future<String>login({
    required Login login
  });
}
class Loginrepository extends BaseLoginRepository{
  final BaseLoginData _baseLoginData;

  Loginrepository(this._baseLoginData);
  
  @override
  Future<String> login({required Login login}) async{
    return await _baseLoginData.login(login: login);
  }


  
}