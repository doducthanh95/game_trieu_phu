import 'package:ai_la_trieu_phu/setup_provider.dart';
import 'package:ai_la_trieu_phu/common/constants/color.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:ai_la_trieu_phu/common/navigation/route_names.dart';
import 'package:ai_la_trieu_phu/feature/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        navigatorKey: Routes.instance.navigatorKey,
        title: AppString.APP_NAME,
        initialRoute: RouteName.splash,
        theme: ThemeData(
          primaryColor: ColorConstants.COLOR_PRIMARY,
          fontFamily: 'Opensans',
        ),
        // default
      ),
    );
  }
}
