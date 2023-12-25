import 'package:equatable/equatable.dart';

class UserAuth extends Equatable {
  final String email;
  final String password;
  const UserAuth({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email,password];
}
