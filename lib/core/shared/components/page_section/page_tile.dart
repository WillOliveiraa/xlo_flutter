import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile({
    required this.label,
    required this.iconData,
    required this.onTap,
    required this.highlighted,
  });

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            color: highlighted ? color : Colors.black54,
            fontWeight: FontWeight.w700),
      ),
      leading: Icon(iconData, color: highlighted ? color : Colors.black54),
      onTap: onTap,
    );
  }
}
