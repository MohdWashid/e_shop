import 'package:e_shop/feautures/home/model/productmodel.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductResponse productResponse;

  ProductLoaded(this.productResponse);
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError(this.errorMessage);
}
