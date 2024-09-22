import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle get f18PoppinsWhiteW500 => GoogleFonts.poppins(
        color: AppColors.kWhite,
        fontSize: 18 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get f12PoppinskMediumGreyW400 => GoogleFonts.poppins(
      color: AppColors.kMediumGrey,
      fontSize: 12 * SizeConfig.textMultiplier,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
      decorationColor: AppColors.kMediumGrey,
      fontStyle: FontStyle.italic);
  static TextStyle get f12PoppinskBrightGreenW400 => GoogleFonts.poppins(
      color: AppColors.kBrightGreen,
      fontSize: 12 * SizeConfig.textMultiplier,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic);
  static TextStyle get f12PoppinskBlackW400 => GoogleFonts.poppins(
      color: AppColors.kBlack,
      fontSize: 12 * SizeConfig.textMultiplier,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic);
  static TextStyle get f14PoopinsBlackW400 => GoogleFonts.poppins(
        color: AppColors.kBlack,
        fontSize: 14 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get f14PoopinsBlackW700 => GoogleFonts.poppins(
        color: AppColors.kBlack,
        fontSize: 14 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get f14PoopinsWhiteW700 => GoogleFonts.poppins(
        color: AppColors.kWhite,
        fontSize: 14 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get f16PoopinskDarkBlueW700 => GoogleFonts.poppins(
        color: AppColors.kDarkBlue,
        fontSize: 16 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get f12PoopinsBlackW400 => GoogleFonts.poppins(
        color: AppColors.kBlack,
        fontSize: 12 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get f20PoopinsBlackW700 => GoogleFonts.poppins(
        color: AppColors.kDarkBlue,
        fontSize: 20 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get f16PoppinsWhiteW700 => GoogleFonts.poppins(
        color: AppColors.kWhite,
        fontSize: 16 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w700,
      );
}
