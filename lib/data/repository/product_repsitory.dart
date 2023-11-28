import 'package:tebalink_task/core/constants.dart';
import 'package:tebalink_task/data/datawarehouse/remote/products_data.dart';
import 'package:tebalink_task/data/model/product_api_model.dart';
import 'package:tebalink_task/domain/entites/product_api.dart';

import '../../domain/entites/products.dart';

abstract class BaseProductRepository{
  Future<List<Products>> getProducts({
    required int page
  });
}

class ProductsRepository extends BaseProductRepository{
  final BaseProductData _baseProductData;

  ProductsRepository(this._baseProductData);
  @override
  Future<List<Products>> getProducts({
    required int page
  })async {
    final response =await _baseProductData.getProducts(page: page);
    final ProductAPi productAPi=ProductAPiModel.fromJson(response.data);
    AppConstant.maxPages=productAPi.meta.lastPage;
    return productAPi.products;
  }

}