import 'package:ai_la_trieu_phu/common/utils/log_util.dart';
import 'package:ai_la_trieu_phu/feature/models/question.dart';
import 'package:ai_la_trieu_phu/feature/services/api.dart';
import 'package:ai_la_trieu_phu/common/constants/string.dart';

class QuestionService {
  final _fireStore = api;
  List<Question> listQuestion = [];

  Future queryAllTransaction() async {
    try {
      final querySnapshot = await _fireStore
          .collection(KeyConstant.KEY_TABLE_QUESTION)
          .getDocuments();
      listQuestion = [];
      //query to question
      for (final doc in querySnapshot.documents) {
        final question = Question.fromSnapshot(doc);
        listQuestion.add(question);
      }
      for (var item in listQuestion) {
        LOG.info(item.toJson());
      }
    } catch (e) {
      LOG.error('QuestionService/querryAll : $e');
    }
  }
}
