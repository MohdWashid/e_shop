import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/feautures/home/bloc/product_cubit.dart';
import 'package:e_shop/feautures/home/bloc/state.dart';
import 'package:e_shop/feautures/home/presenation/widgets/product_view.dart';
import 'package:e_shop/helper/quickhelp.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  static const String route = '/productListScreen';

  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductCubit _productCubit;
  bool _showDiscountedPrice = true;
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  @override
  void initState() {
    super.initState();
    _productCubit = BlocProvider.of<ProductCubit>(context);
    _fetchRemoteConfig();
    _productCubit.fetchProducts();
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      await _remoteConfig.fetchAndActivate();
      setState(() {
        _showDiscountedPrice = _remoteConfig.getBool('show_discounted_price');
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kDarkBlue,
        title: Text(
          'e-shop',
          style: AppTextStyle.f14PoopinsWhiteW700,
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: QuickHelp.showLoadingAnimation());
          } else if (state is ProductLoaded) {
            return ProductView(
              products: state.productResponse.products,
              showDiscountedPrice: _showDiscountedPrice,
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return const Center(child: Text('No products available.'));
        },
      ),
    );
  }
}
