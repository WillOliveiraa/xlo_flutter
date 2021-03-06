import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/shared/themes/app_colors.dart';

class BarButton extends StatelessWidget {
  const BarButton(
      {required this.label, required this.decoration, required this.onTap});

  final String label;
  final BoxDecoration decoration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: decoration,
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.kTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
