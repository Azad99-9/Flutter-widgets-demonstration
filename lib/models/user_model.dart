// code required to create and define user class/model

// UserModel {
//   String userName;
//   String password;
//   String displayPicture;
//   int followerCount;
//   String description;

//   UserModel(this.userName, this.password, this.displayPicture, this.followerCount, this.description);

//   UserModel.fromJson(Map<String, dynamic> json) {
//     userName = json['username'];
//     password = json['password'];
//     displayPicture = json['displayPicture'];
//     followerCount = json['followerCount'];
//     description = json['description'];
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


class UserModel {
  String userName;
  String password;
  String description;

  UserModel({required this.userName, required this.password, required this.description});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['username'],
      password: json['password'],
      description: json['description'],

    );
  }
}