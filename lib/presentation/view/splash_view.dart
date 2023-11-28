import 'package:flutter/material.dart';
import 'package:tebalink_task/core/constants.dart';
import 'package:tebalink_task/data/datawarehouse/local/cache_helper.dart';
import 'package:tebalink_task/presentation/view/home_view.dart';
import 'package:tebalink_task/presentation/view/login_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: AppConstant.userAccessToken)!=null?const HomeView():const LoginView();
  }
}