import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/shared/utils/constants.dart';
import 'package:xlo_flutter/core/shared/widgets/circular_progress_ind_default.dart';

class CustomDrawerHeader extends StatelessWidget {
  final AuthController authController = Modular.get();

  @override
  Widget build(BuildContext context) {
    final user = authController.user;
    return GestureDetector(
      onTap: () {
        if (!authController.isLoggedIn) {
          Navigator.of(context).pop();
          Modular.to.pushNamed(signInRouter);
        }
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Observer(builder: (_) {
              return _showImageUser(authController.user?.image);
            }),
            Observer(builder: (_) {
              if (authController.loading) {
                return Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 5),
                  child: const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndDefault(),
                  ),
                );
              }

              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      authController.isLoggedIn
                          ? user?.name ?? ''
                          : headerAccessYourAccount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      authController.isLoggedIn
                          ? user?.email ?? ''
                          : headerClickHere,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _showImageUser(dynamic image) {
    if (image != null) {
      return Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: image is File
                ? FileImage(image) as ImageProvider<Object>
                : NetworkImage(image.toString()),
          ),
          const SizedBox(width: 20),
        ],
      );
    }

    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Icon(Icons.person, color: Colors.white, size: 35),
        const SizedBox(width: 20),
      ],
    );
  }
}
