import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tebalink_task/core/dependency_injection.dart';
import 'package:tebalink_task/data/datawarehouse/local/cache_helper.dart';
import 'package:tebalink_task/data/datawarehouse/remote/data_helper.dart';
import 'package:tebalink_task/domain/entites/login.dart';
import 'package:tebalink_task/domain/use_cases/user_login_case.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  DpendencyInjection().init();
    test('test login api ', () async{
    UserLoginCase userLoginCase=UserLoginCase(dependencyInjection());
   final msg=await userLoginCase.excute(
    login: Login(provider: "customer", userName: "01090591563", password: 'asd123456789'));
   expect(msg, "تم تسجيل الدخول بنجاح");
    
  });
}