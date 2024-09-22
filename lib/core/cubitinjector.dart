import 'package:e_shop/feautures/auth/bloc/email_cubit.dart';
import 'package:e_shop/feautures/home/bloc/product_cubit.dart';
import 'package:e_shop/feautures/home/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CubitsInjector {
  static final CubitsInjector _instance = CubitsInjector._internal();

  CubitsInjector._internal() {
    _registerCubits();
  }

  static final GetIt _getIt = GetIt.instance;

  void _registerCubits() {
    _getIt.registerLazySingleton<AuthCubit>(
        () => AuthCubit()); // Change to EmailAuthCubit
    _getIt.registerLazySingleton<ProductCubit>(
        () => ProductCubit(ProductRepository()));
  }

  static void resetCubits() {
    _getIt.reset();
    _instance._registerCubits();
  }

  static AuthCubit get emailAuthCubit =>
      _getIt<AuthCubit>(); 
  static ProductCubit get productCubit => _getIt<ProductCubit>();

  factory CubitsInjector() => _instance;

  static List<BlocProvider> get blocProviders => [
        BlocProvider<AuthCubit>(
          // Change to EmailAuthCubit
          create: (context) => _getIt<AuthCubit>(),
        ),
        BlocProvider<ProductCubit>(
          // Change to EmailAuthCubit
          create: (context) => _getIt<ProductCubit>(),
        ),
      ];
}
