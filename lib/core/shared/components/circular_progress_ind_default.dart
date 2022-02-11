import 'package:flutter/material.dart';

class CircularProgressIndDefault extends StatelessWidget {
  const CircularProgressIndDefault({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation(color ?? Theme.of(context).primaryColor)),
    );
  }
}
