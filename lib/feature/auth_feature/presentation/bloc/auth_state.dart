part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadingAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SuccessfullySignInState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SuccessfullyCheckCodeState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SuccessfullySignUpState extends AuthState {
  @override
  List<Object?> get props => [];
}

class ErrorAuthState extends AuthState {
  final Object error;
  const ErrorAuthState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class ErrorSignUpState extends AuthState {
  final Object error;
  const ErrorSignUpState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}


class CheckAuthKeyState extends AuthState {
  const CheckAuthKeyState();
  @override
  List<Object?> get props => [];
}

class BadAuthKeyState extends AuthState {
  const BadAuthKeyState();
  @override
  List<Object?> get props => [];
}

class ErrorSecureState extends AuthState {
  final Object error;
  const ErrorSecureState({
    required this.error
  });

  @override
  List<Object?> get props => [error];
}