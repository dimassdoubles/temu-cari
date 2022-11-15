import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';
import '../../shared/errors/failures.dart';

class GetUserLoggedIn {
  UserRepository repository;
  GetUserLoggedIn({required this.repository});

  Future<Either<Failure, FirebaseUser>> call() async {
    return await repository.getUser();
  }
}
