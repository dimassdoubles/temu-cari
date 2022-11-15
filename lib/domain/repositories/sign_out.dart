import 'user_repository.dart';

class SignOut {
  UserRepository repository;
  SignOut({required this.repository});

  call() {
    repository.signOut();
  }
}
