import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        controller: controller,
        style: AppTextStyle.f14PoopinsBlackW400,
        decoration: InputDecoration(
          fillColor: AppColors.kLightBlue,
          filled: true,
          prefixIcon: prefixIcon,
          hintStyle: AppTextStyle.f14PoopinsBlackW400,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
              vertical: 5 * SizeConfig.heightMultiplier,
              horizontal: 10 * SizeConfig.widthMultiplier),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        keyboardType: keyboardType,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $hintText';
              }
              return null;
            },
      ),
    );
  }
}
