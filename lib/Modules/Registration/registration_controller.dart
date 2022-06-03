import 'package:bookatease/Modules/Registration/registration_repository.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final RegistrationRepository repository;

  RegistrationController(this.repository);

  ///
  /// Form key to validate form
  ///
  final _registrationFromKey = GlobalKey<FormState>();

  GlobalKey get registrationFromKey => _registrationFromKey;

  ///
  /// Registration page textController
  ///
  final _passwordTextEditingController = TextEditingController();
  final _confirmpasswordTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _nameTextEditingController = TextEditingController();
  final _usernameTextEditingController = TextEditingController();

  TextEditingController get passwordTextEditingController =>
      _passwordTextEditingController;
  TextEditingController get emailTextEditingController =>
      _emailTextEditingController;
  TextEditingController get confirmPasswordTextEditingController =>
      _confirmpasswordTextEditingController;
  TextEditingController get usernameTextEditingController =>
      _usernameTextEditingController;
  TextEditingController get nameTextEditingController =>
      _nameTextEditingController;


  /// Signup
  registerUser() async{
    if (_registrationFromKey.currentState!.validate()) {
    await  repository.registerApiCall({
        "email": _emailTextEditingController.text.trim(),
        "username":_usernameTextEditingController.text.trim(),
        "password": _passwordTextEditingController.text.trim(),
        "password2": _confirmpasswordTextEditingController.text.trim(),
        "name": _nameTextEditingController.text.trim()
      });
    Get.offAllNamed(Routes.homeScreen);
    }
  }
}
