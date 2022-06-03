import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/AuthorDetails/author_detail_controller.dart';
import 'package:bookatease/Modules/AuthorDetails/author_detail_repository.dart';
import 'package:get/get.dart';

class AuthorDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthorDetailsController>(
            () => AuthorDetailsController(AuthorDetailsRepository(ApiManager())));
  }
}
