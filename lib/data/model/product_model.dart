import 'package:tebalink_task/domain/entites/products.dart';

class ProductModel extends Products{
  ProductModel(super.name, super.price, super.discount, super.images);
  
  factory ProductModel.fromJson(Map<String,dynamic> json)=>
  ProductModel(json['name'], json['price'], json['discount'],json['images'].cast<String>());

  

}