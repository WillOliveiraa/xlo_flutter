import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/shared/components/button_default.dart';

class ImageDialog extends StatelessWidget {
  final dynamic image;
  final VoidCallback onDelete;

  const ImageDialog({required this.image, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(image as File),
          ButtonDefault(
            child: const Text('Excluir'),
            primaryColor: Colors.white,
            secondColor: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
          )
        ],
      ),
    );
  }
}
