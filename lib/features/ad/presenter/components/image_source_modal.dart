import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  ImageSourceModal({required this.onImageSelected});

  final Function(File) onImageSelected;

  final ImagePicker picker = ImagePicker();

  Future<void> imageSelected(String path, BuildContext context) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Editar Imagem',
        toolbarColor: Theme.of(context).primaryColor,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: const IOSUiSettings(
          title: 'Editar Imagem',
          cancelButtonTitle: 'Cancelar',
          doneButtonTitle: 'Concluir'),
    );

    if (croppedFile != null) onImageSelected(croppedFile);
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Theme.of(context).primaryColor,
                elevation: 0,
              ),
              child: const Text('Câmera'),
              onPressed: () async {
                final PickedFile file =
                    // ignore: deprecated_member_use
                    (await picker.getImage(source: ImageSource.camera))!;
                imageSelected(file.path, context);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Theme.of(context).primaryColor,
                elevation: 0,
              ),
              child: const Text('Galeria'),
              onPressed: () async {
                final PickedFile file =
                    // ignore: deprecated_member_use
                    (await picker.getImage(source: ImageSource.gallery))!;
                imageSelected(file.path, context);
              },
            ),
          ],
        ),
      );
    else
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o anúncio'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Câmera'),
            // onPressed: getFromCamera,
            onPressed: () async {
              final PickedFile file =
                  // ignore: deprecated_member_use
                  (await picker.getImage(source: ImageSource.camera))!;
              imageSelected(file.path, context);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Galeria'),
            onPressed: () async {
              final PickedFile file =
                  // ignore: deprecated_member_use
                  (await picker.getImage(source: ImageSource.gallery))!;
              imageSelected(file.path, context);
            },
          ),
        ],
      );
  }
}
