// login screen ui code
  // user email text field
  // user password text field
  // login button
    // viewModel.userLogin()
      // User will be navigated to the home page
  


import 'package:first_project/view_models/login_screen_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StackedView<LoginScreenViewModel> {
  const LoginScreen({super.key});

  // defining controllers here

  @override
  Widget builder(BuildContext context, LoginScreenViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen"),),
      body: Center(
        child: Column(
          children: [
            viewModel.isLoggedIn ?
            Column(children: [
               Text("${viewModel.currentUser!.email} has been successfully logged in") ,
               ElevatedButton(onPressed: viewModel.userLogout, child: Text("Logout"))
            ])
            
            : Column(
              children: [
            //     TextField(
            //   controller: viewModel.emailController,
            //   decoration: InputDecoration(
            //     hintText: "enter your email",
            //   ),
            // ),
            // TextField(
            //   controller: viewModel.passwordController,
            //   decoration: InputDecoration(
            //     hintText: "enter your password",
            //   ),
            // ),
            ElevatedButton(onPressed: viewModel.userLogin, child: Text("Login with google")),
              ],
            ),
          ]
        )
      ),
    );
  }

  @override
  LoginScreenViewModel viewModelBuilder(BuildContext context) {
    return LoginScreenViewModel(context: context);
  }

}













// ------------demonstartion of pseudo

// double calculateSimpleInterest() {
//   var principleAmount = 10000;
//   var time = 12;
//   var rate = 10;
//   return (principleAmount * time * rate) / 100;
// }


// define a method called calculateSimpleInterest, which returns double
  // take the input of principleAmount
  // take the input of time
  // take the input of rate
  // return by calculating PTR/100
