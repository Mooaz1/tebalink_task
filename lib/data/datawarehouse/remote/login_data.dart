import 'package:tebalink_task/core/constants.dart';
import 'package:tebalink_task/core/end_points.dart';
import 'package:tebalink_task/data/datawarehouse/local/cache_helper.dart';
import 'package:tebalink_task/data/datawarehouse/remote/data_helper.dart';
import 'package:tebalink_task/domain/entites/login.dart';

abstract class BaseLoginData{
  Future<String> login({
    required Login login
  });
}
class LoginData extends BaseLoginData{
  @override
  Future<String> login({required Login login}) async{
  final response=  await DioHelper.postData(url: EndPoints.login,data: {
      "provider":login.provider,
      "username":login.userName,
      "password":login.password,
    });

    if (response.statusCode==200)await CacheHelper.saveData(key: AppConstant.userAccessToken, value: response.data['data']['access_token']);
    
    return response.data['message'];
    
  }

}