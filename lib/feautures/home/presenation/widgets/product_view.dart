import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:e_shop/feautures/home/model/productmodel.dart';
import 'package:e_shop/helper/quickhelp.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final List<Product> products;
  final bool showDiscountedPrice;

  const ProductView({
    super.key,
    required this.products,
    required this.showDiscountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0 * SizeConfig.widthMultiplier),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 172 *
                SizeConfig.widthMultiplier /
                320 *
                SizeConfig.heightMultiplier,
            crossAxisSpacing: 10 * SizeConfig.widthMultiplier,
            mainAxisSpacing: 10 * SizeConfig.heightMultiplier,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildProductCard(products[index]);
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    final double discountedPrice =
        product.price * (1 - (product.discountPercentage / 100));

    return Container(
      width: 172 * SizeConfig.widthMultiplier,
      height: 310 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        color: AppColors.kLightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) =>
                    Center(child: QuickHelp.showLoadingAnimation()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppTextStyle.f14PoopinsBlackW700,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4 * SizeConfig.heightMultiplier),
                  Text(
                    product.description,
                    style: AppTextStyle.f12PoopinsBlackW400,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4 * SizeConfig.heightMultiplier),
                  _buildPriceSection(product, discountedPrice),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection(Product product, double discountedPrice) {
    if (showDiscountedPrice) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('\$${product.price.toStringAsFixed(2)}',
              style: AppTextStyle.f12PoppinskMediumGreyW400),
          Text('\$${discountedPrice.toStringAsFixed(2)}',
              style: AppTextStyle.f12PoppinskBlackW400),
          Text('${product.discountPercentage.toStringAsFixed(0)}% OFF',
              style: AppTextStyle.f12PoppinskBrightGreenW400),
        ],
      );
    } else {
      return Text('\$${product.price.toStringAsFixed(2)}',
          style: AppTextStyle.f14PoopinsBlackW700);
    }
  }
}
