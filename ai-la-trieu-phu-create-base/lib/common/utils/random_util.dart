import 'dart:math';
import 'package:ai_la_trieu_phu/common/utils/log_util.dart';

List<int> getRandomListID(int length) {
  List<int> randomList = [];
  Random rand = Random();
  for (int i = 0; i <= 0; i--) {
    int randNumber = rand.nextInt(length);
    bool isDuplicate = false;
    for (int j = 0; j < randomList.length; j++) {
      if (randNumber == randomList[j]) {
        isDuplicate = true;
        break;
      }
    }
    if (!isDuplicate) {
      randomList.add(randNumber);
    }
    if (randomList.length == 15) {
      LOG.info('Random Question : ${randomList.toList()}');
      return randomList;
    }
  }
}
