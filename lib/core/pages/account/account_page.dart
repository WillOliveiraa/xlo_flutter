import 'dart:io';

import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/shared/widgets/button_default.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Modular.get<AuthController>();
    return Scaffold(
      appBar: AppBar(title: Text('Minha Conta')),
      drawer: CustomDrawer(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 160,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: AnimatedCard(
                              direction: AnimatedCardDirection.top,
                              child: _showImageUser(authController.user?.image),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Observer(builder: (_) {
                            return AnimatedCard(
                              direction: AnimatedCardDirection.bottom,
                              initDelay: Duration(milliseconds: 400),
                              child: Center(
                                child: Text(
                                  authController.user!.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            );
                          }),
                          AnimatedCard(
                            direction: AnimatedCardDirection.bottom,
                            initDelay: Duration(milliseconds: 900),
                            child: Center(
                              child: Text(
                                authController.user!.email,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    AnimatedCard(
                      direction: AnimatedCardDirection.top,
                      duration: Duration(milliseconds: 1900),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ButtonDefault(
                          child: Text('EDITAR'),
                          primaryColor: Colors.white,
                          secondColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            Modular.to.pushNamed(signUpRouter,
                                arguments: authController.user);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              AnimatedCard(
                direction: AnimatedCardDirection.bottom,
                child: ListTile(
                  title: Text(
                    'Meus anúncios',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Modular.to.pushNamed(myAdsRouter);
                  },
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.bottom,
                initDelay: Duration(milliseconds: 600),
                child: ListTile(
                  title: Text(
                    'Favoritos',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Modular.to.pushNamed(myFavoriteAdsRouter);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showImageUser(dynamic image) {
    if (image != null) {
      return Center(
        child: Hero(
          tag: 'userImg',
          child: CircleAvatar(
            radius: 32,
            backgroundImage: image is File
                ? FileImage(image) as ImageProvider<Object>
                : NetworkImage(image.toString()),
          ),
        ),
      );
    }

    return Hero(
      tag: 'userImg',
      child: CircleAvatar(
        radius: 32,
        backgroundColor: Colors.grey[300],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: SvgPicture.asset('assets/icons/User.svg'),
        ),
      ),
    );
  }
}
