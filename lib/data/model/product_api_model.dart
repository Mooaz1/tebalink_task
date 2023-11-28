import 'package:tebalink_task/data/model/meta_model.dart';
import 'package:tebalink_task/data/model/product_model.dart';
import 'package:tebalink_task/domain/entites/product_api.dart';

import '../../domain/entites/products.dart';

class ProductAPiModel extends ProductAPi{
  ProductAPiModel(super.products, super.meta);

  factory ProductAPiModel.fromJson(Map<String,dynamic> json){
     final List<Products> products = <Products>[];
    if (json['data'] != null) {
       
      json['data'].forEach((v) {
        products.add( ProductModel.fromJson(v));
      });}
 return ProductAPiModel(products, MetaModel.fromJson(json['meta']));
  }
 

}