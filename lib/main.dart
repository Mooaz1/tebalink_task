import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tebalink_task/core/app_routes/app_routes.dart';
import 'package:tebalink_task/core/dependency_injection.dart';
import 'package:tebalink_task/data/datawarehouse/local/cache_helper.dart';
import 'package:tebalink_task/data/datawarehouse/remote/data_helper.dart';
import 'package:tebalink_task/presentation/cubits/login/login_cubit.dart';
import 'package:tebalink_task/presentation/cubits/observer/observer.dart';
import 'package:tebalink_task/presentation/cubits/products/products_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  DpendencyInjection().init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp( AppRoot(appRoutes: AppRoutes(),));
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key,required this.appRoutes});
  final AppRoutes appRoutes;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit(dependencyInjection())),
           BlocProvider(create: (context) => ProductsCubit(dependencyInjection())..getProducts())
        ],
        child: MaterialApp(
          title: 'TebaLink Task',
        onGenerateRoute: appRoutes.generate,
        ),
      ),
    );
  }
}
