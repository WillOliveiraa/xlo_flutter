import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/shared/widgets/button_default.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({required this.image, required this.onDelete});

  final dynamic image;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _showImage(image),
          ButtonDefault(
            primaryColor: Colors.white,
            secondColor: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
            child: const Text('Excluir'),
          )
        ],
      ),
    );
  }

  Widget _showImage(dynamic image) {
    if (image is File) return Image.file(image);

    return Image.network(image as String);
  }
}
