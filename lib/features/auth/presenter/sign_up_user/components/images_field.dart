import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/image_dialog.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/image_source_modal.dart';
import 'package:xlo_flutter/features/auth/presenter/sign_up_user/sign_up_user_controller.dart';

class UserImageField extends StatelessWidget {
  const UserImageField(this.signUpUserController);

  final SignUpUserController signUpUserController;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      signUpUserController.setImage(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
          height: 120,
          child: Observer(
            builder: (_) {
              if (signUpUserController.image == null) {
                return GestureDetector(
                  onTap: () {
                    if (Platform.isAndroid) {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) => ImageSourceModal(
                              onImageSelected: onImageSelected));
                    } else {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (_) => ImageSourceModal(
                              onImageSelected: onImageSelected));
                    }
                  },
                  child: CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt,
                            size: 40, color: Colors.white),
                      ],
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => ImageDialog(
                        image: signUpUserController.image,
                        onDelete: () => signUpUserController.setImage(null),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 72,
                    backgroundImage: signUpUserController.image is File
                        ? FileImage(
                            signUpUserController.image as File,
                          ) as ImageProvider<Object>
                        : NetworkImage(signUpUserController.image.toString()),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
