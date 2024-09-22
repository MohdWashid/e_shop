import 'package:e_shop/feautures/home/bloc/state.dart';
import 'package:e_shop/feautures/home/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(ProductInitial());

  Future<void> fetchProducts({int skip = 0, int limit = 10}) async {
    try {
      emit(ProductLoading());
      final products = await productRepository.fetchProducts(skip: skip, limit: limit);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
