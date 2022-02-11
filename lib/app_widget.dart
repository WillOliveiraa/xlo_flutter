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

import 'core/base/base_page.dart';
import 'core/controllers/auth_controller.dart';
import 'core/shared/router/routers.dart';
import 'features/auth/data/datasources/sign_in_with_email_datasource.dart';
import 'features/auth/data/datasources/sign_up_user_datasource.dart';
import 'features/auth/data/repositories/sign_in_with_email_repository_imp.dart';
import 'features/auth/data/repositories/sign_up_user_repository_imp.dart';
import 'features/auth/domain/repositories/sign_in_with_email_repository.dart';
import 'features/auth/domain/repositories/sign_up_user_repository.dart';
import 'features/auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'features/auth/domain/usecases/sign_up_user_usecase.dart';
import 'features/auth/external/sign_in_with_email_datasource_imp.dart';
import 'features/auth/external/sign_up_user_datasource_imp.dart';
import 'features/auth/presenter/sign_in/sign_in_controller.dart';
import 'features/auth/presenter/sign_in/sign_in_page.dart';
import 'features/auth/presenter/sign_up_user/sign_up_user_controller.dart';
import 'features/auth/presenter/sign_up_user/sign_up_user_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Datasources
        Provider<SaveAdDatasource>(create: (_) => SaveAdDatasourceImp()),
        Provider<GetAllAdsDatasource>(create: (_) => GetAllAdsDatasourceImp()),
        Provider<SignInWithEmailDatasource>(
            create: (_) => SignInWithEmailDatasourceImp()),
        Provider<SignUpUserDatasource>(
            create: (_) => SignUpUserDatasourceImp()),

        // Repositories
        Provider<SaveAdRepository>(
            create: (context) => SaveAdRepositoryImp(context.read())),
        Provider<GetAllAdsRepository>(
            create: (context) => GetAllAdsRepositoryImp(context.read())),
        Provider<SignInWithEmailRepository>(
            create: (context) => SignInWithEmailRepositoryImp(context.read())),
        Provider<SignUpUserRepository>(
            create: (context) => SignUpUserRepositoryImp(context.read())),

        // Usecases
        Provider<SaveAdUseCaseImp>(
            create: (context) => SaveAdUseCaseImp(context.read())),
        Provider<GetAllAdsUseCaseImp>(
            create: (context) => GetAllAdsUseCaseImp(context.read())),
        Provider<SignInWithEmailUseCaseImp>(
            create: (context) => SignInWithEmailUseCaseImp(context.read())),
        Provider<SignUpUserUseCaseImp>(
            create: (context) => SignUpUserUseCaseImp(context.read())),

        // Controllers
        ChangeNotifierProvider(create: (context) => AuthController()),
        // ChangeNotifierProvider(
        //     create: (context) => HomeController(context.read())),
        ChangeNotifierProvider<AdController>(
            create: (context) => AdController(context.read())),
        ChangeNotifierProvider<SignInController>(
            create: (context) =>
                SignInController(context.read(), context.read())),
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
            case signInRouter:
              return MaterialPageRoute(builder: (_) => SignInPage());
            case signUpRouter:
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
