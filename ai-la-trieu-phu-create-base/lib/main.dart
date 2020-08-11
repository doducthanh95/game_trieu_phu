import 'package:ai_la_trieu_phu/common/di/injector.dart';
import 'package:ai_la_trieu_phu/feature/app.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    print(notification.audioId);
    return true;
  });
  Injector.setup();
  runApp(App());
}
