import 'package:dio/dio.dart';
import 'package:tebalink_task/core/end_points.dart';
import 'package:tebalink_task/data/datawarehouse/remote/data_helper.dart';

abstract class BaseProductData{
Future<Response> getProducts({
  required int page
});

}

class ProductsData extends BaseProductData{
  @override
  Future<Response> getProducts({required int page}) async{
    final response= await DioHelper.getData(url:"${EndPoints.products}?page=4");
  return response;
  }


}