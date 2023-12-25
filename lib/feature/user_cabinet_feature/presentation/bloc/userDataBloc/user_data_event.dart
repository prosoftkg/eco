part of 'user_data_bloc.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();
}

class ChangeUserDataEvent extends UserDataEvent {
  final UserDataForEdit userDataForEdit;
  const ChangeUserDataEvent({
    required this.userDataForEdit
  });

  @override
  List<Object?> get props => [userDataForEdit];
}
