import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/data/repositories/save_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ads_repository.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_ad_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/external/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/external/save_ad_datasource_imp.dart';
import 'package:xlo_flutter/features/ad/presenter/ad_controller.dart';
import 'package:xlo_flutter/features/home/presenter/home_controller.dart';

import 'core/base/base_page.dart';
import 'features/auth/data/datasources/sign_up_user_datasource.dart';
import 'features/auth/data/repositories/sign_up_user_repository_imp.dart';
import 'features/auth/domain/repositories/sign_up_user_repository.dart';
import 'features/auth/domain/usecases/sign_up_user_usecase.dart';
import 'features/auth/external/sign_up_user_datasource_imp.dart';
import 'features/auth/presenter/login/login_page.dart';
import 'features/auth/presenter/sign_up_user/sign_up_user_controller.dart';
import 'features/auth/presenter/sign_up_user/sign_up_user_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SaveAdDatasource>(create: (_) => SaveAdDatasourceImp()),
        Provider<SignUpUserDatasource>(
            create: (_) => SignUpUserDatasourceImp()),
        Provider<SaveAdRepository>(
            create: (context) => SaveAdRepositoryImp(context.read())),
        Provider<SignUpUserRepository>(
            create: (context) => SignUpUserRepositoryImp(context.read())),
        Provider<SignUpUserUseCaseImp>(
            create: (context) => SignUpUserUseCaseImp(context.read())),
        Provider<SaveAdUseCaseImp>(
            create: (context) => SaveAdUseCaseImp(context.read())),
        Provider<GetAllAdsDatasource>(create: (_) => GetAllAdsDatasourceImp()),
        Provider<GetAllAdsRepository>(
            create: (context) => GetAllAdsRepositoryImp(context.read())),
        Provider<GetAllAdsUseCaseImp>(
            create: (context) => GetAllAdsUseCaseImp(context.read())),
        ChangeNotifierProvider(
            create: (context) => HomeController(context.read())),
        ChangeNotifierProvider<AdController>(
            create: (context) => AdController(context.read())),
        ChangeNotifierProvider<SignUpUserController>(
            create: (context) => SignUpUserController(context.read())),
      ],
      child: MaterialApp(
        builder: asuka.builder,
        title: 'XLO',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primaryColor: Colors.purple,
        //   scaffoldBackgroundColor: Colors.purple,
        //   // appBarTheme: const AppBarTheme(elevation: 0),
        // ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginPage());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpUserPage());
            case '/':
            default:
              return MaterialPageRoute(
                  builder: (_) => BasePage(), settings: settings);
          }
        },
      ),
    );
  }
}
