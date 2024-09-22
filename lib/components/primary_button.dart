import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String label;
  final void Function()? onTap;
  final double height;
  final double width;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final Color btnColor;
  final double? scale;
  final String? iconAsset;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? borderWidth;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.height = 49,
    this.width = 231,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.btnColor = AppColors.kDarkBlue,
    this.iconAsset,
    this.textStyle,
    this.borderColor,
    this.borderWidth,
    this.scale = 1,
  });

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        height: widget.height * SizeConfig.heightMultiplier,
        width: widget.width * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderWidth ?? 0,
          ),
          color:
              _isPressed ? widget.btnColor.withOpacity(0.8) : widget.btnColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Transform.scale(
          scale: _isPressed ? 0.95 : 1.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.iconAsset != null)
                Row(children: [
                  Image.asset(
                    widget.iconAsset!,
                    scale: widget.scale,
                  ),
                  SizedBox(
                    width: 10 * SizeConfig.widthMultiplier,
                  ),
                ]),
              Text(
                widget.label,
                style: widget.textStyle ?? AppTextStyle.f16PoppinsWhiteW700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
