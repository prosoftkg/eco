import 'package:equatable/equatable.dart';

class BeginTestEntity extends Equatable {
  BeginTestEntity({
    required this.question,
    required this.questionEn,
    required this.questionKy,
    required this.mid,
    required this.answer,
    required this.number,
    required this.testId,
    required this.count,
  });

  final String? question;
  final dynamic questionEn;
  final String? questionKy;
  final int? mid;
  final List<Answer> answer;
  final int? number;
  final dynamic testId;
  final dynamic count;

  factory BeginTestEntity.fromJson(Map<String, dynamic> json){
    return BeginTestEntity(
      question: json["question"],
      questionEn: json["question_en"],
      questionKy: json["question_ky"],
      mid: json["mid"],
      answer: json["answer"] == null ? [] : List<Answer>.from(json["answer"]!.map((x) => Answer.fromJson(x))),
      number: json["number"],
      testId: json["test_id"],
      count: json["count"],
    );
  }

  @override
  List<Object?> get props => [
    question, questionEn, questionKy, mid, answer, number, testId, count, ];
}

class Answer extends Equatable {
  Answer({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.titleKy,
  });

  final int? id;
  final String? title;
  final String? titleEn;
  final String? titleKy;

  factory Answer.fromJson(Map<String, dynamic> json){
    return Answer(
      id: json["id"],
      title: json["title"],
      titleEn: json["title_en"],
      titleKy: json["title_ky"],
    );
  }

  @override
  List<Object?> get props => [
    id, title, titleEn, titleKy, ];
}
