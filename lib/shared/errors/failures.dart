import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FirebaseFailure extends Failure {
  @override
  List<Object?> get props => [];
}
