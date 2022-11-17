import 'package:dartz/dartz.dart';

import '../../shared/errors/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  signInWithGoogle();
  signOut();
  Future<bool> isSignIn();
  Future<Either<Failure, FirebaseUser>> getUser();
}
