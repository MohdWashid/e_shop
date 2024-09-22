import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final String? hintText;

  const CustomPasswordField({
    super.key,
    required this.passwordController,
    this.hintText,
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * SizeConfig.heightMultiplier,
      child: TextFormField(
        controller: widget.passwordController,
        style: AppTextStyle.f14PoopinsBlackW400,
        decoration: InputDecoration(
          fillColor: AppColors.kLightBlue,
          filled: true,
          hintText: widget.hintText ?? "Enter your password",
          hintStyle: AppTextStyle.f14PoopinsBlackW400,
          contentPadding: EdgeInsets.symmetric(
              vertical: 5 * SizeConfig.heightMultiplier,
              horizontal: 10 * SizeConfig.widthMultiplier),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters long';
          }
          return null;
        },
      ),
    );
  }
}
