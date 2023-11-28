import 'package:tebalink_task/data/repository/product_repsitory.dart';
import 'package:tebalink_task/domain/entites/products.dart';

class GetProductCase{
  final BaseProductRepository _baseProductRepository;

  GetProductCase(this._baseProductRepository);

 Future<List<Products>> excute({
  required int page
 })async{
  return await _baseProductRepository.getProducts(page: page);
    
  }

}