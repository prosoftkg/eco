part of 'user_cabinet_bloc.dart';

abstract class UserCabinetEvent extends Equatable {
  const UserCabinetEvent();
}


class EditUserDataEvent extends UserCabinetEvent {
  final UserDataForEdit userDataForEdit;
  const EditUserDataEvent({
    required this.userDataForEdit
  });

  @override
  List<Object?> get props => [userDataForEdit];
}