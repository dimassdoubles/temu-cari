import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../../shared/errors/failures.dart';

abstract class UserRepository {
  signInWithGoogle();
  signOut();
  Future<bool> isSignIn();
  Future<Either<Failure, FirebaseUser>> getUser();
}
