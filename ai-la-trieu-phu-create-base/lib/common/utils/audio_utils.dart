import 'package:ai_la_trieu_phu/common/constants/string.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioUtils {
  static Duration _duration = Duration();
  static Duration _position = Duration();
  static AudioPlayer audioPlayer;
  static AudioCache audioCache;

  static void initAudio() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.durationHandler = (d) => () {
          _duration = d;
        };
    audioPlayer.positionHandler = (d) => () {
          _position = d;
        };
  }

  static void playAudio() {
    audioCache.play(AppString.LOCAL_AUDIO_APP);
  }
}
