import 'package:bloc/bloc.dart';
import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/feature/auth_feature/domain/use_case/checkConfirmationCode.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/use_case/read_auth_key.dart';
import '../../domain/use_case/sign_in.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  final ReadAuthKey readAuthKey;
  final CheckConfirmationCode checkConfirmationCode;

  AuthBloc({required this.signIn,required this.readAuthKey, required this.checkConfirmationCode})
      : super(AuthInitial()) {
    on<SignInEvent>(_signIn);
    on<CheckAuthKeyEvent>(_readAuthKeyEvent);
    on<CheckConfirmationCodeEvent>(_checkConfirmationCode);
  }

  _signIn(SignInEvent event, Emitter emit) async {
    final email = event.email;
    emit(LoadingAuthState());
    if (email !='') {
      final either = await signIn.call(email);
      either
          .fold((error) => emit(const ErrorAuthState(error: 'Ваши данные не верны')),
              (active) {
        if (active == true){
          emit(SuccessfullySignInState(email: email));
        }
        else if(active==false) {
          emit(const ErrorAuthState(error: 'Ваши данные не верны'));
        }else{
          emit(const ErrorAuthState(error: 'Ошибка'));
        }

      });
    } else {
      emit(const ErrorAuthState(error: 'Введите данные'));
    }
  }

  _readAuthKeyEvent(CheckAuthKeyEvent event, Emitter emit) async {
    final chekPassword = await readAuthKey.call(NoParams());
    chekPassword.fold((error) {
      debugPrint(error.toString());
      emit(ErrorSecureState(error: error));
    }, (password) {
      if (password) {
        debugPrint('пароль есть');
        emit(const CheckAuthKeyState());
      } else {
        debugPrint('пароля нет');
        emit(const BadAuthKeyState());
      }
    });
  }

  _checkConfirmationCode(CheckConfirmationCodeEvent event, Emitter emit) async {
    final code = event.code;
    emit(LoadingAuthState());
    if (code !='') {
      final either = await checkConfirmationCode.call(code);
      either
          .fold((error) => emit(const ErrorAuthState(error: 'Введите данные')),
              (active) {
            if (active){
              emit(SuccessfullyCheckCodeState());
            }
            else {
              emit(const ErrorAuthState(error: 'Проверочный код не найден или устарел'));
            }

          });
    } else {
      emit(const ErrorAuthState(error: 'Введите данные'));
    }
  }
}
