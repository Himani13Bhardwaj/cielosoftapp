import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/GenreDetails/genere_detail_controller.dart';
import 'package:bookatease/Modules/GenreDetails/genere_detail_repository.dart';
import 'package:get/get.dart';

class GenreDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreDetailsController>(
            () => GenreDetailsController(GenreDetailsRepository(ApiManager())));
  }
}
