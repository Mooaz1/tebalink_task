import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tebalink_task/core/constants.dart';
import 'package:tebalink_task/domain/entites/products.dart';
import 'package:tebalink_task/domain/use_cases/get_product_case.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProductCase) : super(ProductsInitial());
  final GetProductCase _getProductCase;
  int page = 1;
  late int maxPages;
  bool loading =false;
  List<Products> products = [];

  getProducts() async {
    emit(GetProductLoadState());
    final products = await _getProductCase.excute(page: page);
    maxPages=AppConstant.maxPages;
  
   
    if (products.isNotEmpty) {
      this.products.addAll(products);

      AppConstant.appToast(
          text: "${this.products.length} item loaded successfully!",
          color: Colors.green);
      emit(GetProductSuccessState());
    } else if(page==maxPages){
       AppConstant.appToast(
          text: "Max has been reached!",
          color: Colors.red);
           emit(GetProductSuccessState());
    }
    
    else{
       AppConstant.appToast(
          text: "error has been occurerd!",
          color: Colors.red);
                emit(GetProductFailureState());

    }
  }
  loadProducts({
    required bool value
  }){
    loading=value;
    emit(LoadProductsState());
  }
  incPage(){
     page++;
       emit(IncPageState());
   
  }
}
