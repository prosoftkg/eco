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

class DeleteProfileEvent extends UserCabinetEvent {
  const DeleteProfileEvent();

  @override
  List<Object?> get props => [];
}