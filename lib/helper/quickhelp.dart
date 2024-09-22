import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/core/enum.dart';
import 'package:e_shop/feautures/auth/presentation/signup.dart';
import 'package:e_shop/feautures/home/presenation/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';

class QuickHelp {
  // Show loading animation
  static Widget showLoadingAnimation({double size = 40}) {
    return Center(
      child: LoadingAnimationWidget.beat(
        color: AppColors.kDarkBlue,
        size: size,
      ),
    );
  }

  // Check if user is logged in
  static bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // Get the initial route based on login status
  static String getInitialRoute() {
    return isUserLoggedIn() ? ProductListScreen.route : SignupScreen.route;
  }

  // Show toast messages
  static ToastController showToast(BuildContext context,
      {required ToastType type, String? title, IconData? icon, String? image}) {
    switch (type) {
      case ToastType.error:
        return InteractiveToast.popError(
          context,
          title: _buildToastTitle(title, icon, Colors.red, image),
        );
      case ToastType.success:
        return InteractiveToast.popSuccess(
          context,
          title: _buildToastTitle(title, icon, Colors.green, image),
        );
      case ToastType.info:
        return InteractiveToast.pop(
          context,
          title: _buildToastTitle(title, icon, AppColors.kWhite, image),
        );
      case ToastType.warning:
        // Handle warning case if needed
        break;
    }
    throw UnsupportedError('ToastType not supported');
  }

  // Helper method to build toast title
  static Widget _buildToastTitle(
      String? title, IconData? icon, Color iconColor, String? image) {
    return Row(
      children: [
        Text(
          title ?? '',
          style: AppTextStyle.f12PoopinsBlackW400,
        ),
        if (icon != null) Icon(icon, color: iconColor, size: 20),
        if (image != null) Image.asset(image, height: 20, width: 20),
      ],
    );
  }
}
