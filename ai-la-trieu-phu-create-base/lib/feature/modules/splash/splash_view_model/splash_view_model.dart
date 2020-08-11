import 'dart:async';

import 'package:ai_la_trieu_phu/common/bases/base_view_model.dart';
import 'package:ai_la_trieu_phu/common/di/injector.dart';
import 'package:ai_la_trieu_phu/common/navigation/route_names.dart';
import 'package:ai_la_trieu_phu/feature/routes.dart';
import 'package:ai_la_trieu_phu/feature/services/question_service.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SplashViewModel extends BaseViewModel {
  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");
  final List<StreamSubscription> _subscriptions = [];

  Future<void> initData() async {
    await Injector.resolve<QuestionService>().queryAllTransaction();
    Routes.instance.navigateAndRemove(RouteName.home);
  }

  void initAudio() {
    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print("playlistAudioFinished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print("audioSessionId : $sessionId");
    }));
    _subscriptions
        .add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return false;
    }));
  }

  void dissPose() {
    _assetsAudioPlayer.stop();
    _assetsAudioPlayer.dispose();
    print('adadad');
  }

  void re() {
    _assetsAudioPlayer.play();

    print('adadad');
  }

  void pase() {
    _assetsAudioPlayer.pause();

    print('adadad');
  }

  void playAudio(String localAudio) {
    _assetsAudioPlayer.open(Audio(localAudio));
  }
}
