import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/shared/components/custom_drawer/custom_drawer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                height: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Observer(builder: (_) {
                          //   return Text(
                          //     GetIt.I<UserManagerStore>().user.name,
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //       color: Colors.purple,
                          //       fontWeight: FontWeight.w900,
                          //     ),
                          //   );
                          // }),
                          // Text(
                          //   GetIt.I<UserManagerStore>().user.email,
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //     color: Colors.grey[700],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        child: Text('EDITAR'),
                        textColor: Colors.purple,
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => EditAccountScreen(),
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Meus anúncios',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (_) => MyAdsScreen()));
                },
              ),
              ListTile(
                title: Text(
                  'Favoritos',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (_) => FavoritesScreen(hideDrawer: true)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
