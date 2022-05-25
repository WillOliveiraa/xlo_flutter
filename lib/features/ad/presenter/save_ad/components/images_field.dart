import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/image_dialog.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/components/image_source_modal.dart';
import 'package:xlo_flutter/features/ad/presenter/save_ad/save_ad_controller.dart';

class ImagesField extends StatelessWidget {
  const ImagesField(this.adController);

  final SaveAdController adController;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      adController.images.add(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(
            builder: (_) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: adController.images.length as int < 5
                    ? adController.images.length + 1 as int
                    : 5,
                itemBuilder: (_, int index) {
                  if (index == adController.images.length) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          if (Platform.isAndroid) {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => ImageSourceModal(
                                onImageSelected: onImageSelected,
                              ),
                            );
                          } else {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (_) => ImageSourceModal(
                                onImageSelected: onImageSelected,
                              ),
                            );
                          }
                        },
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.grey[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsets.fromLTRB(8, 16, index == 4 ? 8 : 0, 16),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => ImageDialog(
                              image: adController.images[index],
                              onDelete: () =>
                                  adController.images.removeAt(index),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: adController.images[index] is File
                              ? FileImage(
                                  adController.images[index] as File,
                                ) as ImageProvider<Object>
                              : NetworkImage(
                                  adController.images[index].toString(),
                                ),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
        Observer(
          builder: (_) {
            if (adController.imagesError != null) {
              return Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.red)),
                ),
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  adController.imagesError!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
