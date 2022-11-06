import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temu_cari/domain/repositories/sign_out.dart';
import 'package:temu_cari/domain/usecases/get_user_logged_in.dart';
import 'package:temu_cari/domain/usecases/is_sign_in.dart';
import 'package:temu_cari/domain/usecases/sign_in_with_google.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_event.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_state.dart';

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
