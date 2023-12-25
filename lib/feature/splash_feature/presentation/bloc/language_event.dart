part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class SelectLanguageEvent extends LanguageEvent {
  final String lanCode;
  const SelectLanguageEvent({
    required this.lanCode
  });

  @override
  List<Object?> get props => [lanCode];
}

