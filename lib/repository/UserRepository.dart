import 'package:flutter_base_app/model/response/UserModel.dart';
import 'package:flutter_base_app/networkLayer/ApiUrl.dart';
import 'package:flutter_base_app/networkLayer/HttpClient.dart';

class UserRepository {
  Future<UserModel> getUserProfile() async {
    final response = await HttpClient.instance.fetchData(ApiUrl.GET_PROFILE);
    return UserModel.fromJson(response);
  }
}
