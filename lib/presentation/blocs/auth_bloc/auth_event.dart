import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class AppStart extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoggedOut extends AuthEvent {
  @override
  List<Object?> get props => [];
}
