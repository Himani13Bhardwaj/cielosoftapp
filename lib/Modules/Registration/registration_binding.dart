import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/Registration/registration_controller.dart';
import 'package:bookatease/Modules/Registration/registration_repository.dart';
import 'package:get/get.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(
            () => RegistrationController(RegistrationRepository(ApiManager())));
  }
}
