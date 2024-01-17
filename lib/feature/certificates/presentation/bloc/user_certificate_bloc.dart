import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_certificate_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/use_case/user_certificate_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/use_case/use_case.dart';

part 'user_certificate_event.dart';
part 'user_certificate_state.dart';

class UserCertificateBloc extends Bloc<UserCertificateEvent, UserCertificateState> {
  final UserCertificateUseCase userCertificateUseCase;
  UserCertificateBloc({required this.userCertificateUseCase}) : super(UserCertificateInitial()) {
    on<LoadUserCertificateEvent>(_userCertificate);
  }
  _userCertificate(LoadUserCertificateEvent event,Emitter emit)async{
    emit(LoadingUserCertificateState());
    final either=await userCertificateUseCase.call(NoParams());
    either.fold((error) => emit(ErrorUserCertificateState(error: error)), (userCertificate){
      emit(LoadedUserCertificateState(userCertificate: userCertificate));
    });
  }
}
