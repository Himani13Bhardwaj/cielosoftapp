import 'package:bookatease/Modules/Login/login_repository.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController(this.repository);

  ///
  /// Form key to validate form
  ///
  final _loginFromKey = GlobalKey<FormState>();

  GlobalKey get loginFromKey => _loginFromKey;

  ///
  /// Login page textController
  ///
  final _passwordTextEditingController = TextEditingController();

  TextEditingController get passwordTextEditingController =>
      _passwordTextEditingController;

  final _emailTextEditingController = TextEditingController();

  TextEditingController get emailTextEditingController =>
      _emailTextEditingController;

  final _otpSent = false.obs;

  bool get otpSent => _otpSent.value;

  final RxBool _isReader = true.obs;

  bool get isReader => _isReader.value;

  /// Send otp
  sendOtp() {
    if (_loginFromKey.currentState!.validate()) {
      _otpSent.value = true;
    }
  }

  changeUserMode(bool isReaderMode) {
    _isReader.value = isReaderMode;

    GetStorage().write(AppPreferencesHelper.pUserMode, isReaderMode);
  }

  login() {
    ///
    /// Business logic
    ///
    if (_isReader.value) {
      Get.offAllNamed(Routes.homeScreen);
    } else {
      Get.offAllNamed(Routes.writerHomeScreen);
    }
    GetStorage().write(AppPreferencesHelper.pUser, true);
  }

  @override
  void onInit() {
    _isReader.value = GetStorage().read(AppPreferencesHelper.pUserMode) ?? true;
    print(
        "Amit" + GetStorage().read(AppPreferencesHelper.pUserMode).toString());
    super.onInit();
  }
}
