import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Modules/Onboarding/splash_screen.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_repository.dart';
import 'package:get/get.dart';

class ReaderProfileController extends GetxController {
  final ReaderProfileRepository repository;

  ReaderProfileController(this.repository);

  switchToWriter() {
    LoginController loginController = Get.find();

    loginController.changeUserMode(false);
    Get.offAll(() => const SplashScreen(), transition: Transition.cupertino);
  }

  switchToReader() {
    LoginController loginController = Get.find();
    loginController.changeUserMode(true);
    Get.offAll(() => const SplashScreen(), transition: Transition.cupertino);
  }
}
