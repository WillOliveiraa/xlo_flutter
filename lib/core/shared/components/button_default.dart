import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault({
    Key? key,
    required this.child,
    this.onPressed,
    this.primaryColor,
    this.secondColor,
  }) : super(key: key);

  final Widget child;
  final Function()? onPressed;
  final Color? primaryColor;
  final Color? secondColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor ?? Theme.of(context).primaryColor,
          onPrimary: secondColor ?? Colors.white,
          elevation: 0,
          onSurface: Theme.of(context).primaryColor.withAlpha(150),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
