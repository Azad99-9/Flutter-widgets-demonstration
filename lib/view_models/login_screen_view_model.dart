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

import 'package:first_project/models/user_model.dart';
import 'package:first_project/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class LoginScreenViewModel extends BaseViewModel{
  // all the businesslogic related to the login screen goes here

  BuildContext context;
  UserModel? currentUser;

  LoginScreenViewModel({required this.context});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final userService = UserService();

  bool get isLoggedIn => currentUser != null;

  void userLogin() {
    String email = emailController.text;
    String password = passwordController.text;

    bool notValidPassword = !userService.validatePassword(password: password);

    if (notValidPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("please enter a valid password", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,)
      );
      return;
    }

    bool userAccountDoesntExist = !userService.checkIfUserAlreadyHasAccount(userName: email);

    if (userAccountDoesntExist) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("your account doesn't exist, please create an account", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,)
      );
      return;
    }

    UserModel? dbUser = userService.authenticateTheUser(userName: email, password: password);
    bool wrongCredentials = dbUser == null;
    if (wrongCredentials) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("please enter valid credentials", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,)
      );
      return;
    }

    currentUser = dbUser;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("you have successfully, logged in.", style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,)
      );
    return;
  }
}