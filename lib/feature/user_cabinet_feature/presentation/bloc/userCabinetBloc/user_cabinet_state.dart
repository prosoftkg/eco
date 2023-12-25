part of 'user_cabinet_bloc.dart';

abstract class UserCabinetState extends Equatable {
  const UserCabinetState();
}

class UserCabinetInitial extends UserCabinetState {
  @override
  List<Object> get props => [];
}

class LoadingUserCabinetState extends UserCabinetState {
  @override
  List<Object?> get props => [];
}

class SuccessfullyEditUserDataState extends UserCabinetState {
  @override
  List<Object?> get props => [];
}

class ErrorUserCabinetState extends UserCabinetState {
  final Object error;
  const ErrorUserCabinetState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
