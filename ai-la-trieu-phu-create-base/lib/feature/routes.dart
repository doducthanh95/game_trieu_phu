import 'package:ai_la_trieu_phu/common/navigation/fade_in_route.dart';
import 'package:ai_la_trieu_phu/common/navigation/route_names.dart';
import 'package:ai_la_trieu_phu/feature/modules/game/game_view/game_page/game_page.dart';
import 'package:ai_la_trieu_phu/feature/modules/home/home_view/home_page/home_page.dart';
import 'package:ai_la_trieu_phu/feature/modules/splash/splash_view/splash_page.dart';
import 'package:flutter/material.dart';

class Routes {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Routes() => _instance;

  Routes._internal();

  static final Routes _instance = Routes._internal();

  static Routes get instance => _instance;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateAndReplace(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  pop({dynamic result}) {
    return navigatorKey.currentState.pop(result);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return FadeInRoute(widget: SplashPage());
      case RouteName.home:
        return FadeInRoute(widget: HomePage());
      case RouteName.game:
        return FadeInRoute(widget: Game());
      default:
        return _emptyRoute(settings);
    }
  }

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
