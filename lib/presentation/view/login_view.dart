import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tebalink_task/core/text_style.dart';
import 'package:tebalink_task/domain/entites/login.dart';
import 'package:tebalink_task/presentation/cubits/login/login_cubit.dart';
import 'package:tebalink_task/presentation/widgets/login_button.dart';

import '../widgets/login_view_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "TebaLink Task",
          style: AppTextStyle.appBarText(),
        ),
      ),
      body: Form(
        key: loginCubit.loginFormKey,
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: LoginScreenForm(
                      hintText: "Provider",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is requierd*";
                        }
                        return null;
                      },
                      prefixIcon: const Icon(Icons.account_tree_outlined),
                      controller: loginCubit.providerController),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: LoginScreenForm(
                      hintText: "Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is requierd*";
                        }
                        return null;
                      },
                      prefixIcon: const Icon(Icons.person),
                      controller: loginCubit.userNameController),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: LoginScreenForm(
                      hintText: "Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is requierd*";
                        }
                        return null;
                      },
                      prefixIcon: const Icon(Icons.lock),
                      controller: loginCubit.passwordController),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: LoginButton(
                      backgroundColor: state is UserLoginLoadState
                          ? Colors.grey
                          : Colors.blue[200],
                      onPress: () {
                        if (state is! UserLoginLoadState) {
                          if (loginCubit.loginFormKey.currentState!
                              .validate()) {
                            loginCubit.login = Login(
                                provider: loginCubit.providerController.text,
                                userName: loginCubit.userNameController.text,
                                password: loginCubit.passwordController.text);
                            loginCubit.userLogin(context: context);
                          }
                        }
                      },
                      text: "Login"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
