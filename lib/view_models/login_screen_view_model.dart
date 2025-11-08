// code required to create user_view_model

// UserViewModel {


//   userLogin() {
//     validatePassword()
//     checkIfUserAlreadyHasAccount()
          // UserModel (
//                      "username": "Shaikazad2003",
//                      "password": "Password,
//                      "diaplayPicture": "pictureUrl",
//                      "followerCount": 20,
//                      "description": "Software engineer",
//                     )
//     AuthenticateTheUser()

//    notifyListeners()
//   }


// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/models/user_model.dart';
import 'package:first_project/services/authentication_service.dart';
import 'package:first_project/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class LoginScreenViewModel extends BaseViewModel{
  // all the businesslogic related to the login screen goes here

  BuildContext context;
  User? currentUser;

  LoginScreenViewModel({required this.context}) {
    currentUser = FirebaseAuth.instance.currentUser;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final userService = UserService();

  bool get isLoggedIn => currentUser != null;



  Future<void> userLogout () async {
    // await AuthenticationService.logoutwithEmail();
    await AuthenticationService.signoutwithGoogle();
    await FirebaseAuth.instance.signOut();
    currentUser = null;
    notifyListeners();
  }

  Future<void> userLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    // final UserCredential? credential = await AuthenticationService.signupwithEmail(email, password);
    // final UserCredential? credential = await AuthenticationService.loginwithEmail(email, password);
    final UserCredential? credential = await AuthenticationService.signInWithGoogle();

    

    // bool notValidPassword = !userService.validatePassword(password: password);

    // if (notValidPassword) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("please enter a valid password", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,)
    //   );
    //   return;
    // }

    // bool userAccountDoesntExist = !userService.checkIfUserAlreadyHasAccount(userName: email);

    // if (userAccountDoesntExist) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("your account doesn't exist, please create an account", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,)
    //   );
    //   return;
    // }

    // UserModel? dbUser = userService.authenticateTheUser(userName: email, password: password);
    // bool wrongCredentials = dbUser == null;
    // if (wrongCredentials) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("please enter valid credentials", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,)
    //   );
    //   return;
    // }

    currentUser = credential?.user;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("you have successfully, logged in.", style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,)
      );
    return;
  }
}