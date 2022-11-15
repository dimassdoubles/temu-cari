import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';
import '../../shared/errors/failures.dart';

class SignInWithGoogle {
  UserRepository repository;
  SignInWithGoogle({required this.repository});

  Future<Either<Failure, FirebaseUser>> call() async {
    await repository.signInWithGoogle();
    return await repository.getUser();
  }
}
