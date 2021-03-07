import 'package:flutter/foundation.dart';
import 'package:flutter_base_app/model/response/UserModel.dart';
import 'package:flutter_base_app/networkLayer/ApiResponse.dart';
import 'package:flutter_base_app/repository/UserRepository.dart';

class UserProvider with ChangeNotifier {
  late UserRepository _userRepository;

  late ApiResponse<UserModel> _userModelResponse;

  ApiResponse<UserModel> get userModel => _userModelResponse;

  UserProvider() {
    _userRepository = UserRepository();
  }

  fetchUserProfile() async {
    _userModelResponse = ApiResponse.loading("Loading ...");
    notifyListeners();

    try {
      UserModel userModel = await _userRepository.getUserProfile();
      _userModelResponse = ApiResponse.completed(userModel);
      notifyListeners();
    } catch (e) {
      _userModelResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
