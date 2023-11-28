import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:tebalink_task/core/app_routes/app_routes_name.dart';
import 'package:tebalink_task/core/constants.dart';
import 'package:tebalink_task/data/datawarehouse/local/cache_helper.dart';
import 'package:tebalink_task/domain/entites/login.dart';
import 'package:tebalink_task/domain/use_cases/user_login_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._userLoginCase) : super(LoginInitial());
  final UserLoginCase _userLoginCase;
  late Login login;
  final TextEditingController providerController=TextEditingController();
  final TextEditingController userNameController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final loginFormKey=GlobalKey<FormState>();

  userLogin({
    required BuildContext context
  }) async {
    
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult==ConnectivityResult.none){
      AppConstant.appToast(text: "No internet connection!", color: Colors.red);
      return;
    }

      
    emit(UserLoginLoadState());
    final msg = await _userLoginCase.excute(login: login);
    if (CacheHelper.getData(key: AppConstant.userAccessToken) != null) {
      debugPrint(CacheHelper.getData(key: AppConstant.userAccessToken).toString());
      if(context.mounted)Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.homeScreen, (route) => false);

      AppConstant.appToast(text: msg, color: Colors.green);
      emit(UserLoginSuccessState());
    } else {
      AppConstant.appToast(text: msg, color: Colors.red);
      emit(UserLoginFailureState());
    }
  }
}
