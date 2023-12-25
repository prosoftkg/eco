import 'package:equatable/equatable.dart';

class FinishTestEntity extends Equatable {
  const FinishTestEntity({
    required this.progressing,
    required this.achievment,
    required this.score,
  });

  final int? progressing;
  final String? achievment;
  final int? score;

  factory FinishTestEntity.fromJson(Map<String, dynamic> json){
    return FinishTestEntity(
      progressing: json["progressing"],
      achievment: json["achievment"],
      score: json["score"],
    );
  }

  @override
  List<Object?> get props => [progressing, achievment, score ];
}
