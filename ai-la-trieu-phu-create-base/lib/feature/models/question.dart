import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  int id;
  DocumentReference reference;
  String questionContent;
  String answerA;
  String answerB;
  String answerC;
  String answerD;
  // audio type
  String audioA;
  String audioB;
  String audioC;
  String audioD;
  String audioQuestion;
  String audioFull;
  int result;

  Question(
      {this.id = -1,
      this.questionContent = '',
      this.answerA = '',
      this.answerB = '',
      this.answerC = '',
      this.answerD = '',
      this.audioA = '',
      this.audioB = '',
      this.audioC = '',
      this.audioD = '',
      this.audioFull = '',
      this.audioQuestion = '',
      this.result = 0});

  Question.fromMap(Map<String, dynamic> map, {this.reference})
      : id = int.parse(map['id'].toString()),
        questionContent = map['question_content'],
        answerA = map['aswer_a'],
        answerB = map['aswer_b'],
        answerC = map['aswer_c'],
        answerD = map['aswer_d'],
        audioA = map['audio_a'],
        audioB = map['audio_b'],
        audioC = map['audio_c'],
        audioD = map['audio_d'],
        audioQuestion = map['audio_question'],
        audioFull = map['audio_full'],
        result = int.parse(map['result'].toString());

  Question.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['question_content'] = questionContent;
    data['aswer_a'] = answerA;
    data['aswer_b'] = answerB;
    data['aswer_c'] = answerC;
    data['aswer_d'] = answerD;
    data['audio_a'] = audioA;
    data['audio_b'] = audioB;
    data['audio_c'] = audioC;
    data['audio_d'] = audioD;
    data['audio_question'] = audioQuestion;
    data['audio_full'] = audioFull;
    data['result'] = result;
    return data;
  }

  String getResult() {
    switch (result) {
      case 2:
        return 'B';
      case 3:
        return 'C';
      case 4:
        return 'D';
      default:
        return 'A';
    }
  }
}
