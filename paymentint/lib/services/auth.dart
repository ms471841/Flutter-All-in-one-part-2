import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:paymentint/data/models/user.dart';
import 'package:paymentint/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Database _database = Database();
  //check for use logged in or not
  Future<MyUser?> isUserLoggedIn() async {
    final user = _auth.currentUser;
    if (user != null) {
      return await _database.getUserData(user.uid);
    }
  }

//sign in with email and password
  Future<void> loginWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in: ${userCredential.user?.email}');
    } on FirebaseAuthException catch (e) {
      // Handle errors and throw an exception
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email address.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        default:
          errorMessage =
              'An error occurred while trying to sign in. Please try again later.';
      }
      print('FirebaseAuthException: ${e.code}, ${e.message}');
      throw errorMessage;
    }
  }

//sign in with google
  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        return userCredential.user;
      } on FirebaseAuthException catch (e) {
        // Handle errors and throw an exception
        String errorMessage;
        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'No user found for that email address.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided for that user.';
            break;
          default:
            errorMessage =
                'An error occurred while trying to sign in. Please try again later.';
        }
        print('FirebaseAuthException: ${e.code}, ${e.message}');
        throw errorMessage;
      }
    }

    // currentUser = user;
    return null;
  }
}
