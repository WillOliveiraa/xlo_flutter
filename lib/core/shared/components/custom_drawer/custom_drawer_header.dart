import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/components/circular_progress_ind_default.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';

class CustomDrawerHeader extends StatelessWidget {
  final AuthController authController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Modular.to.pushNamed(signInRouter);
      },
      child: Container(
        // color: Colors.purple,
        color: Theme.of(context).primaryColor,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(Icons.person, color: Colors.white, size: 35),
            const SizedBox(width: 20),
            Observer(builder: (_) {
              if (authController.loading) {
                return Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 5),
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndDefault(),
                  ),
                );
              }

              if (authController.isLoggedIn)
                return Visibility(
                  visible: authController.isLoggedIn,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        // RichText
                        TextSpan(
                          text: 'Olá, ',
                          style: TextStyle(fontSize: 18),
                          children: [
                            TextSpan(
                              text: '${authController.user?.name ?? ''}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                );

              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Acesse sua conta agora!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Clique aqui',
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
}
