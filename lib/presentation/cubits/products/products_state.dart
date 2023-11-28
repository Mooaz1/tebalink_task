part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}

class GetProductLoadState extends ProductsState{}
class GetProductSuccessState extends ProductsState{}
class GetProductFailureState extends ProductsState{}
class LoadProductsState extends ProductsState{}
class IncPageState extends ProductsState{}
