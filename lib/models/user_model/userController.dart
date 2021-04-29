import 'package:get/state_manager.dart';
import 'package:kap/models/user_model/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;
  String get userEmail => _userModel.value.email;
  String get userFirstName => _userModel.value.firstName;
  String get userLastName => _userModel.value.lastName;
  String get userPostId => _userModel.value.postId;
  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}
