import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault({
    Key? key,
    required this.child,
    this.onPressed,
    this.primaryColor,
    this.secondColor,
    this.shape,
  }) : super(key: key);

  final Widget child;
  final Function()? onPressed;
  final Color? primaryColor;
  final Color? secondColor;
  final RoundedRectangleBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor ?? Theme.of(context).primaryColor,
          onPrimary: secondColor ?? Colors.white,
          elevation: 0,
          shape: shape,
          onSurface: primaryColor != null
              ? primaryColor!.withAlpha(150)
              : Theme.of(context).primaryColor.withAlpha(150),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
