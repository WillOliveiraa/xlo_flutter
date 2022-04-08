import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/shared/widgets/button_default.dart';

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
          _showImage(image),
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

  Widget _showImage(dynamic image) {
    if (image is File) return Image.file(image);

    return Image.network(image);
  }
}
