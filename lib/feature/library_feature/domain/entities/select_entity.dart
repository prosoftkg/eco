import 'package:equatable/equatable.dart';

class SelectEntity extends Equatable{
  final String type;
  final String category;
  final String tags;
  final String theme;

  SelectEntity({required this.type, required this.category, required this.tags, required this.theme});

  @override
  List<Object?> get props => [
    type, category, tags, theme, ];
}