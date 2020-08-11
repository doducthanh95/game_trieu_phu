import 'dart:async';
import 'dart:math';
import 'package:ai_la_trieu_phu/common/bases/base_view_model.dart';
import 'package:ai_la_trieu_phu/common/di/injector.dart';
import 'package:ai_la_trieu_phu/common/enum/enum_constants.dart';
import 'package:ai_la_trieu_phu/common/utils/random_util.dart';
import 'package:ai_la_trieu_phu/feature/models/question.dart';
import 'package:ai_la_trieu_phu/feature/services/question_service.dart';
import 'package:ai_la_trieu_phu/common/utils/log_util.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import '../../../../common/enum/enum_constants.dart';

class GameViewModel extends BaseViewModel {
  List<Question> listQuestion = [];
  Question currentQuestion = Question();
  int currentPosition = 0;
  int selectedAnswer = 5;
  bool isAnswer = false;
  IsCorrect isCorrect = IsCorrect.none;
  Timer timer;
  int countDown = 30;
  bool release = false;

  bool isCallFriend = true;
  bool isEveryHelp = true;
  bool isRemoveHelper = true;

  List<int> percenList = [0, 0, 0, 0];
  List<bool> showList = [true, true, true, true];

  final questionService = Injector.resolve<QuestionService>();

  // static StreamController<int> _controller = StreamController();
  // Stream<int> streamCounDown = _controller.stream.asBroadcastStream();
  // Sink sinkCountDown = _controller.sink..add(30);

  //audio
  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");
  AssetsAudioPlayer get _assetsAudioPlayerQuestion =>
      AssetsAudioPlayer.withId("music");
  final List<StreamSubscription> _subscriptions = [];

  ///
  /// get/set
  ///
  void setSelectedAnswer(int answer) {
    selectedAnswer = answer;
    if (answer < 4) {
      isAnswer = true;
    }
    notifyListeners();
  }

  void re() {
    _assetsAudioPlayer.play();

    print('adadad');
  }

  void pase() {
    _assetsAudioPlayer.pause();

    print('adadad');
  }

  void resetData() {
    this.listQuestion = [];
    this.currentQuestion = Question();
    this.currentPosition = 0;
    this.selectedAnswer = 5;
    this.isAnswer = false;
    this.isCorrect = IsCorrect.none;

    this.isCallFriend = true;
    this.isEveryHelp = true;
    this.isRemoveHelper = true;

    percenList = [0, 0, 0, 0];
    showList = [true, true, true, true];
    notifyListeners();
  }

  ///
  /// logic
  ///
  void initQuestion({bool isReNew = false}) {
    if (isReNew) {
      resetData();
    }
    List<int> listRandomID =
        getRandomListID(questionService.listQuestion.length);
    for (var item in listRandomID) {
      listQuestion.add(questionService.listQuestion[item]);
    }
    currentQuestion = listQuestion.first;
    countDown = 30;
    release = false;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      changeCountDown();
      if (countDown == 0) {
        timer.cancel();
      }
    });
    playAudioNetwork(currentQuestion.audioFull);
    notifyListeners();
  }

  String intToString(int value) {
    switch (value % 4) {
      case 1:
        return 'B';
      case 2:
        return 'C';
      case 3:
        return 'D';
      default:
        return 'A';
    }
  }

  void changeCountDown() {
    countDown--;
    // sinkCountDown.add(countDown);
  }

  void closeStrem() {
    // sinkCountDown.close();
  }
  answerState getState(int currentNumber) {
    if (release) {
      if (currentQuestion.result - 1 == currentNumber) {
        return answerState.correct;
      } else if (currentNumber == selectedAnswer) {
        return answerState.notCorrect;
      } else {
        return answerState.none;
      }
    }
    return answerState.none;
  }

  Future<void> checkAnswer() async {
    release = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2)).then((value) => {
          if (selectedAnswer == currentQuestion.result - 1)
            {
              if (currentPosition < listQuestion.length - 1)
                {
                  isCorrect = IsCorrect.correct,
                }
              else
                {
                  isCorrect = IsCorrect.win,
                }
            }
          else
            {
              isCorrect = IsCorrect.notCorrect,
            }
        });
    notifyListeners();
  }

// go to next question
  void callNext() async {
    LOG.debug('=======> ${currentQuestion.result}');
    if (currentPosition < listQuestion.length - 1) {
      currentPosition++;
      currentQuestion = listQuestion[currentPosition];
      percenList = [0, 0, 0, 0];
      showList = [true, true, true, true];
      isAnswer = false;
      selectedAnswer = 4;
      isCorrect = IsCorrect.none;
      countDown = 30;
      release = false;
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        changeCountDown();
        if (countDown == 0) {
          timer.cancel();
        }
      });
      playAudioNetwork(currentQuestion.audioFull);
      notifyListeners();
    } else {}
  }

  ///
  /// 50:50
  ///
  void removeHelper() {
    selectedAnswer = 4;
    if (isRemoveHelper) {
      Random rand = Random();
      int nonRemovePosition;
      for (int i = 0; i <= 0; i--) {
        int randNumber = rand.nextInt(3);
        if (randNumber != currentQuestion.result - 1) {
          nonRemovePosition = randNumber;
          break;
        }
        continue;
      }
      for (int i = 0; i < showList.length; i++) {
        if (i != nonRemovePosition && i != currentQuestion.result - 1) {
          showList[i] = false;
        }
      }
      LOG.debug('======> ${showList.toList()}');
      isRemoveHelper = false;
      notifyListeners();
    }
  }

  ///
  /// every help
  ///
  void everyHelp() {
    if (isEveryHelp) {
      // List<int> percenList = [0, 0, 0, 0];
      Random rand = Random();
      percenList[currentQuestion.result - 1] = rand.nextInt(65) + 35;
      for (int i = 0; i < percenList.length; i++) {
        if (i != currentQuestion.result - 1 && showList[i]) {
          int temp = 0;
          for (int j = 0; j < percenList.length; j++) {
            temp += percenList[j];
          }
          int randNumber = rand.nextInt(100 - temp);
          percenList[i] = randNumber;
        }
      }
      // check for full 100 %
      int balance = 100;
      for (var item in percenList) {
        balance -= item;
      }
      percenList[currentQuestion.result - 1] += balance;
      LOG.debug('Data Every help : ${percenList.toList()}');
      isEveryHelp = false;
      notifyListeners();
      LOG.debug('Data Every help  >>> : ${percenList.toList()}');
    }
  }

  //init Audio
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

  // void dissPose() {
  //   _assetsAudioPlayer.stop();
  //   _assetsAudioPlayer.dispose();
  // }

  void playAudio(String localAudio) {
    // _assetsAudioPlayerQuestion.dispose();
    _assetsAudioPlayer.open(Audio(localAudio));
  }

  void playAudioNetwork(String localAudio) {
    _assetsAudioPlayer.open(Audio.network(localAudio));
  }

  void pauseAudio() {
    _assetsAudioPlayer.pause();
  }

  void change() {
    notifyListeners();
  }

  ///
  /// call friend
  ///
  // resultRandom , 3(or 1) other = 10% per1, none = 10%
  String callFriend() {
    if (isCallFriend) {
      List<String> listResult = []..add('');
      for (int i = 0; i < showList.length; i++) {
        if (showList[i]) {
          listResult.add('${intToString(i)}');
        }
      }
      int count = 10 - listResult.length;
      for (int i = 0; i < count; i++) {
        listResult.add(' ${currentQuestion.getResult()}');
      }
      Random rand = Random();
      int randNumber = rand.nextInt(listResult.length);
      LOG.info('Game/CallFriend : ${listResult[randNumber]}');
      isCallFriend = false;

      notifyListeners();
      return listResult[randNumber];
    } else {
      return null;
    }
  }
}
