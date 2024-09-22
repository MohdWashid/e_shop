import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:flutter/material.dart';

class EmailTextfield extends StatelessWidget {
  final TextEditingController emailController;

  const EmailTextfield({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        controller: emailController,
        style: AppTextStyle.f14PoopinsBlackW400,
        decoration: InputDecoration(
          fillColor: AppColors.kLightBlue,
          filled: true,
          hintText: "Enter your email",
          hintStyle: AppTextStyle.f14PoopinsBlackW400,
          contentPadding: EdgeInsets.symmetric(
              vertical: 5 * SizeConfig.heightMultiplier,
              horizontal: 10 * SizeConfig.widthMultiplier),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
      ),
    );
  }
}
