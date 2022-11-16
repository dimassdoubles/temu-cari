import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../domain/entities/user.dart';
import '../../../shared/errors/exceptions.dart';

abstract class UserRemoteDataSource {
  signInWithGoogle();
  singOut();
  Future<bool> isSignIn();
  Future<FirebaseUser> getUser();
}

class FirebaseUserDataSource extends UserRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseUserDataSource({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<FirebaseUser> getUser() {
    try {
      final currentUser = firebaseAuth.currentUser;
      return Future.value(FirebaseUser(
        id: currentUser!.uid,
        name: currentUser.displayName,
      ));
    } catch (error) {
      throw (FirebaseGetUserException());
    }
  }

  @override
  Future<bool> isSignIn() {
    final currentUser = firebaseAuth.currentUser;
    return Future.value(currentUser != null);
  }

  @override
  signInWithGoogle() async {
    // trigger authentication
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // obtain the authentication detail
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // create credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // once signed in, return the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
    return firebaseAuth.currentUser;
  }

  @override
  singOut() async {
    return Future.wait([
      firebaseAuth.signOut(),
      googleSignIn.signOut(),
    ]);
  }
}
