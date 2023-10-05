import 'dart:async';
import 'package:privateinsta/core/constants/endpoints.dart';
import 'package:privateinsta/core/utils/dio_clients.dart';
import 'package:privateinsta/src/auth/model/sign_in_model.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  FutureOr<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // final BaseRespose<SignInModel> a =
      //     await DioClient<SignInModel>().get(Endpoints.checkUsername);
      // print(a);
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> checkUserName({
    required String userName,
  }) async {
    try {
      final String user = '${Endpoints.checkUsername}$userName';
      // final BaseRespose<List<String>> resposeData =
      //     await DioClient<List<String>>().get(user);
      // print(resposeData.status);
    } catch (e) {
      rethrow;
    }
  }

//   /// Starts the Sign In with Google Flow.
//   ///
//   /// Throws a [LogInWithGoogleFailure] if an exception occurs.
//   Future<void> signInWithGoogle() async {
//     try {
//       late final firebase_auth.AuthCredential credential;
//       if (isWeb) {
//         final googleProvider = firebase_auth.GoogleAuthProvider();
//         final userCredential = await _firebaseAuth.signInWithPopup(
//           googleProvider,
//         );
//         credential = userCredential.credential!;
//       } else {
//         final googleUser = await _googleSignIn.signIn();
//         final googleAuth = await googleUser!.authentication;
//         credential = firebase_auth.GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//       }
//       await _firebaseAuth.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       throw LogInWithGoogleFailure.fromCode(e.code);
//     } catch (e) {
//       throw const LogInWithGoogleFailure();
//     }
//   }

//   /// Signs out the current user which will emit
//   /// [User.empty] from the [user] Stream.
//   ///
//   /// Throws a [LogOutFailure] if an exception occurs.
//   Future<void> signOut() async {
//     try {
//       await Future.wait([
//         _firebaseAuth.signOut(),
//         _googleSignIn.signOut(),
//       ]);
//     } catch (e) {
//       throw LogOutFailure();
//     }
//   }
// }

// extension on firebase_auth.User {
//   User get toUser {
//     return User(
//       id: uid,
//       email: email,
//       name: displayName,
//       photo: photoURL,
//     );
//   }
}
