part of 'language_bloc.dart';

class LanguageState extends Equatable {
  String lanCode='system';

  LanguageState({required this.lanCode});
  @override
  List<Object?> get props => [lanCode];
}

class LanguageInitial extends LanguageState {
  LanguageInitial({required super.lanCode});
  @override
  List<Object> get props => [];
}