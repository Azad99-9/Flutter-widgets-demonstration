import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthenticationService {

  static Future<UserCredential?> signInWithGoogle() async {
  try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn(); // opens up a google dialog box
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      print("✅ Google Sign-In Successful");


      final appcredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return appcredential;
    } catch (e) {
      print("❌ Google Sign-In Failed: $e");
    }
  }

  static Future<void> signoutwithGoogle() async {
    await GoogleSignIn().signOut();
    print("successfully signed out");
  }


  static Future<UserCredential?> signupwithEmail(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User created successfully");
      return credential;
    } catch (e) {
      print("❌ Sign up failed: $e");
    }
  }

  static Future<UserCredential?> loginwithEmail(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ Logged in successfully");
      return credential;
    } catch (e) {
      print("❌ Login failed: $e");
    }
  }

  static Future<void> logoutwithEmail() async {
    await FirebaseAuth.instance.signOut();
    print("✅ Logged out successfully");
  }


}



