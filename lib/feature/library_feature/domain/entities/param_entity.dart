import 'package:equatable/equatable.dart';

class ParamEntity extends Equatable {
  ParamEntity({
    required this.type,
    required this.category,
    required this.tags,
    required this.theme,
  });

  final Map<String, String> type;
  final Map<String, String> category;
  final Map<String, String> tags;
  final Map<String, String> theme;

  factory ParamEntity.fromJson(Map<String, dynamic> json){
    return ParamEntity(
      type: Map.from(json["Type"]).map((k, v) => MapEntry<String, String>(k, v)),
      category: Map.from(json["Category"]).map((k, v) => MapEntry<String, String>(k, v)),
      tags: Map.from(json["Tags"]).map((k, v) => MapEntry<String, String>(k, v)),
      theme: Map.from(json["Theme"]).map((k, v) => MapEntry<String, String>(k, v)),
    );
  }

  @override
  List<Object?> get props => [
    type, category, tags, theme, ];
}
