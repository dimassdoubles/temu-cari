// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:temu_cari/domain/entities/user.dart';

abstract class AuthState extends Equatable {}

class Uninitialized extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  FirebaseUser user;
  Authenticated(this.user);
  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
  String message;
  Unauthenticated(this.message);
  @override
  List<Object?> get props => [message];
}
