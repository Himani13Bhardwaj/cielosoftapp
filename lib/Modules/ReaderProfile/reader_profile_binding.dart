import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/AddBook/add_book_controller.dart';
import 'package:bookatease/Modules/AddBook/add_book_repository.dart';
import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Modules/Login/login_repository.dart';
import 'package:bookatease/Modules/ReaderBookmark/reader_bookmark_controller.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_controller.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_repository.dart';
import 'package:get/get.dart';

class ReaderProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReaderProfileController>(
      () => ReaderProfileController(
        ReaderProfileRepository(ApiManager()),
      ),
    );
    Get.put(
      () => LoginController(
        LoginRepository(ApiManager()),
      ),
    );
  }
}
