import 'package:ai_la_trieu_phu/feature/modules/game/home_view_model/game_view_model.dart';
import 'package:ai_la_trieu_phu/feature/modules/home/home_view_model/home_view_model.dart';
import 'package:ai_la_trieu_phu/feature/modules/splash/splash_view_model/splash_view_model.dart';
import 'package:ai_la_trieu_phu/feature/services/question_service.dart';
import 'package:kiwi/kiwi.dart';
import 'injector.dart';

class InjectorSetUp extends Injector {
  @override
  void configInjector(Container container) {
    container
      ..registerFactory((container) => SplashViewModel())
      ..registerSingleton((container) => QuestionService())
      ..registerFactory((container) => GameViewModel())
      ..registerSingleton((container) => HomeViewModel());
    // ..registerSingleton((c) => LocalAuthService())
    // ..registerFactory((c) => LocalAuthVM())
  }
}
