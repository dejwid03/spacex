import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_podstawy_utilities/flutter_podstawy_utilities.dart';
import 'package:spacex/di/di.dart';
import 'package:spacex/features/rocket_details/pages/rocket_details_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupServiceLocatorForSpaceXApp();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('pl')],
      //path: getPathToTranslations(), - gotowa biblioteka tłumaczenia z kursu
      path: "assets/lang", // własna stworzona biblioteka tłumaczenia
      fallbackLocale: const Locale('pl'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: navigatorKey,
      home: const RocketDetailsPage(),
    );
  }
}
