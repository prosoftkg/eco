import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial(lanCode: 'system')) {
    on<SelectLanguageEvent>(_selectLanguage);
  }

  _selectLanguage(SelectLanguageEvent event, Emitter emit){
    emit(LanguageState(lanCode: event.lanCode));
  }


}
