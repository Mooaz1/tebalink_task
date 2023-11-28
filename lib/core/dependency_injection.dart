import 'package:get_it/get_it.dart';
import 'package:tebalink_task/data/datawarehouse/remote/login_data.dart';
import 'package:tebalink_task/data/datawarehouse/remote/products_data.dart';
import 'package:tebalink_task/data/repository/login_repository.dart';
import 'package:tebalink_task/data/repository/product_repsitory.dart';
import 'package:tebalink_task/domain/use_cases/get_product_case.dart';
import 'package:tebalink_task/domain/use_cases/user_login_case.dart';

GetIt dependencyInjection = GetIt.instance;

class DpendencyInjection {
  void init() {
    //datawarehouse
    dependencyInjection.registerLazySingleton<BaseLoginData>(() => LoginData());
    dependencyInjection.registerLazySingleton<BaseProductData>(() => ProductsData());



    //repositories
    dependencyInjection.registerLazySingleton<BaseLoginRepository>(
        () => Loginrepository(dependencyInjection()));
        dependencyInjection.registerLazySingleton<BaseProductRepository>(
        () => ProductsRepository(dependencyInjection()));

// usecases
    dependencyInjection
        .registerLazySingleton(() => UserLoginCase(dependencyInjection()));
        dependencyInjection
        .registerLazySingleton(() => GetProductCase(dependencyInjection()));
  }
}
