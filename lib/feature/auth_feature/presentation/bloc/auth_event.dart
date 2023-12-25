part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  const SignInEvent({
    required this.email
  });

  @override
  List<Object?> get props => [email];
}

class CheckConfirmationCodeEvent extends AuthEvent {
  final String code;
  const CheckConfirmationCodeEvent({
    required this.code
  });

  @override
  List<Object?> get props => [code];
}

class CheckAuthKeyEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

