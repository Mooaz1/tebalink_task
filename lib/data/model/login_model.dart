import 'package:tebalink_task/domain/entites/login.dart';

class LoginModel extends Login{
  LoginModel({required super.provider, required super.userName, required super.password});

Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['provider'] = provider;
    data['userName'] = userName;
    data['password'] = password;
    return data;
  }

}