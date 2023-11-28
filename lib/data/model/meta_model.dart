import 'package:tebalink_task/domain/entites/meta.dart';

class MetaModel extends Meta{
  MetaModel( super.lastPage);

  factory MetaModel.fromJson(Map<String,dynamic> json)=>
  MetaModel(json['last_page']);

}