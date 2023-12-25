import 'package:equatable/equatable.dart';

class NextQuestionEntity extends Equatable {
  NextQuestionEntity({
    required this.question,
    required this.questionEn,
    required this.questionKy,
    required this.mid,
    required this.answer,
    required this.number,
    required this.progressing,
  });

  final String? question;
  final dynamic questionEn;
  final String? questionKy;
  final int? mid;
  final List<Answer> answer;
  final int? number;
  final int? progressing;

  factory NextQuestionEntity.fromJson(Map<String, dynamic> json){
    return NextQuestionEntity(
      question: json["question"],
      questionEn: json["question_en"],
      questionKy: json["question_ky"],
      mid: json["mid"],
      answer: json["answer"] == null ? [] : List<Answer>.from(json["answer"]!.map((x) => Answer.fromJson(x))),
      number: json["number"],
      progressing: json["progressing"],
    );
  }

  @override
  List<Object?> get props => [
    question, questionEn, questionKy, mid, answer, number, progressing, ];
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
