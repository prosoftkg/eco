import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final storage = const FlutterSecureStorage();
  LanguageBloc() : super(LanguageInitial(lanCode: 'ru')) {
    on<SelectLanguageEvent>(_selectLanguage);
    // on<CheckLanguageEvent>(_checkLanguage);
  }
  _selectLanguage(SelectLanguageEvent event, Emitter emit)async{
    await storage.write(
        key: 'selectLanguage', value: event.lanCode);
    emit(LanguageState(lanCode: event.lanCode));
  }
  /*_checkLanguage(CheckLanguageEvent event, Emitter emit)async{
    String? lan=await storage.read(key: 'selectLanguage');
    if(lan!=null){
      print('checked');
      emit(CheckedLanguage(lanCode: lan));
    }else{
      print('null');
      emit(NullLanguage());
    }
  }*/
}
