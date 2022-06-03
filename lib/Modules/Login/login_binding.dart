import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Modules/Login/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
            () => LoginController(LoginRepository(ApiManager())));
  }
}
