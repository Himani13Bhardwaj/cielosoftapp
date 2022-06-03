import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/BookDetails/book_detail_controller.dart';
import 'package:bookatease/Modules/BookDetails/book_detail_repository.dart';
import 'package:get/get.dart';

class BookDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookDetailsController>(
            () => BookDetailsController(BookDetailsRepository(ApiManager())));
  }
}
