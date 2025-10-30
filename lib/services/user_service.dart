// code related to User entity

// UserService {

//   validatePassword() {
//     password should be 8 characters
//   }

//   checkIfUserAlreadyHasAccount() {
//     check in the database with the server
//     Data is got from the server in "Json format..."
//     UserModel.fromJson(json) -> UserModel (
//                                         "username": "Shaikazad2003",
//                                         "password": "Password,
//                                         "diaplayPicture": "pictureUrl",
//                                         "followerCount": 20,
//                                         "description": "Software engineer",
//                                    )
//     send the model to the viewmodel
//     
//   }

//   AuthenticateTheUser() {
//     Match the password with the found users credentials
//   }

// }


// Json format

// {
//   "user": {
//     "username": "Shaikazad2003",
//     "password": "Password,
//     "diaplayPicture": "pictureUrl",
//      "followerCount": 20,
//      "description": "Software engineer",

//   },

// }


import 'package:first_project/constants/user_database.dart';
import 'package:first_project/models/user_model.dart';

class UserService {
  bool validatePassword({required String password}) {
    if (password.length >= 8) return true;
    return false;
  }

  bool checkIfUserAlreadyHasAccount({required String userName}) {
    if (users.contains(userName)) {
      return true;
    }
    return false;
  }

  UserModel? authenticateTheUser({required String userName, required String password}) {
    final dbUser = fetchUserDataFromDatabase(userName: userName);

    if (userName == dbUser['username'] && password == dbUser['password']) {
      return UserModel.fromJson(dbUser);
    }

    return null;
  }

  Map<String, dynamic> fetchUserDataFromDatabase({required String userName}) {
    // complex logic for now we will be doing dummy data
    return dbUser;
  }
  
}