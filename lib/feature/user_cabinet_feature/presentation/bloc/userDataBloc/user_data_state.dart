part of 'user_data_bloc.dart';

class UserDataState extends Equatable {
  final UserDataForEdit userData;
  const UserDataState({required this.userData});

  @override
  List<Object> get props => [userData];
}

class UserDataInitial extends UserDataState {
  const UserDataInitial({required super.userData});
  @override
  List<Object> get props => [];
}
