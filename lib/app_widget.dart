import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import 'package:xlo_flutter/features/home/presenter/home_controller.dart';

import 'core/base/base_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SaveAdDatasource>(create: (_) => SaveAdDatasourceImp()),
        Provider<SaveAdRepository>(
            create: (context) => SaveAdRepositoryImp(context.read())),
        Provider<SaveAdUseCaseImp>(
            create: (context) => SaveAdUseCaseImp(context.read())),
        Provider<GetAllAdsDatasource>(create: (_) => GetAllAdsDatasourceImp()),
        Provider<GetAllAdsRepository>(
            create: (context) => GetAllAdsRepositoryImp(context.read())),
        Provider<GetAllAdsUseCaseImp>(
            create: (context) => GetAllAdsUseCaseImp(context.read())),
        ChangeNotifierProvider(
            create: (context) => HomeController(context.read(), context.read()))
      ],
      child: MaterialApp(
        title: 'XLO',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primaryColor: Colors.purple,
        //   scaffoldBackgroundColor: Colors.purple,
        //   // appBarTheme: const AppBarTheme(elevation: 0),
        // ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
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
