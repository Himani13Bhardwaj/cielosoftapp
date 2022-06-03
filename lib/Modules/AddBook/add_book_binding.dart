import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/AddBook/add_book_controller.dart';
import 'package:bookatease/Modules/AddBook/add_book_repository.dart';
import 'package:bookatease/Modules/BookDetails/book_detail_controller.dart';
import 'package:bookatease/Modules/BookDetails/book_detail_repository.dart';
import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Modules/Login/login_repository.dart';
import 'package:get/get.dart';

class AddBookBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBookController>(
        () => AddBookController(
              AddBookRepository(ApiManager()),
            ),
        fenix: true);
    Get.lazyPut<BookDetailsController>(
      () => BookDetailsController(
        BookDetailsRepository(ApiManager()),
      ),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        LoginRepository(ApiManager()),
      ),
    );
  }
}
