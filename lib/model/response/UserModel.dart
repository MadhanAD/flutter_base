class UserModel {
  String message;

  UserModel({this.message});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(message: json["message"]);
  }
}
