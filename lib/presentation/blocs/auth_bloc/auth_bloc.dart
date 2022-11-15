import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/sign_out.dart';
import '../../../domain/usecases/get_user_logged_in.dart';
import '../../../domain/usecases/is_sign_in.dart';
import '../../../domain/usecases/sign_in_with_google.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogle _signInWithGoogle;
  final IsSignIn _isSignIn;
  final SignOut _signOut;
  final GetUserLoggedIn _getUserLoggedIn;

  AuthBloc({
    required SignInWithGoogle signInWithGoogle,
    required IsSignIn isSignIn,
    required SignOut signOut,
    required GetUserLoggedIn getUserLoggedIn,
  })  : _signInWithGoogle = signInWithGoogle,
        _isSignIn = isSignIn,
        _signOut = signOut,
        _getUserLoggedIn = getUserLoggedIn,
        super(Uninitialized()) {
    on<AppStart>(
      (event, emit) async {
        try {
          final isSignIn = await _isSignIn();
          if (isSignIn) {
            final result = await _getUserLoggedIn();
            result.fold(
              (l) => emit(
                Unauthenticated("Belum Login"),
              ),
              (r) => emit(
                Authenticated(r),
              ),
            );
          } else {
            emit(
              Unauthenticated("Belum Login"),
            );
          }
        } catch (error) {
          emit(
            Unauthenticated("Belum Login"),
          );
        }
      },
    );
    on<LoggedIn>(
      (event, emit) async {
        final result = await _signInWithGoogle();
        result.fold(
          (l) => emit(
            Unauthenticated("Login Gagal"),
          ),
          (r) => emit(
            Authenticated(r),
          ),
        );
      },
    );

    on<LoggedOut>(
      (event, emit) async {
        await _signOut();
        emit(
          Unauthenticated("User Logout"),
        );
      },
    );
  }
}
