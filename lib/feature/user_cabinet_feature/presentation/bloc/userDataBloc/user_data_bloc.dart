import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/core/utils/user.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/userData.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataBloc() : super(UserDataInitial(userData: UserDataForEdit(
    name: UserData.name ?? '',
    phone: UserData.phone ?? ''
  )))   {
    on<ChangeUserDataEvent>((event, emit) {
      emit(UserDataState(userData: event.userDataForEdit));
    });
  }
}
