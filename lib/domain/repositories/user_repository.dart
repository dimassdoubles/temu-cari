import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/entities/user.dart';
import 'package:temu_cari/shared/errors/failures.dart';

abstract class UserRepository {
  signInWithGoogle();
  signOut();
  Future<bool> isSignIn();
  Future<Either<Failure, FirebaseUser>> getUser();
}
