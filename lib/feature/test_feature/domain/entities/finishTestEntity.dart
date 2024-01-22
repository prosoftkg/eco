import 'package:equatable/equatable.dart';

class FinishTestEntity extends Equatable {
  FinishTestEntity({
    required this.progressing,
    required this.achievment,
    required this.score,
    required this.mark,
  });

  final int? progressing;
  final String? achievment;
  final int? score;
  final String? mark;

  factory FinishTestEntity.fromJson(Map<String, dynamic> json){
    return FinishTestEntity(
      progressing: json["progressing"],
      achievment: json["achievment"],
      score: json["score"],
      mark: json["mark"],
    );
  }

  @override
  List<Object?> get props => [
    progressing, achievment, score, mark, ];
}
