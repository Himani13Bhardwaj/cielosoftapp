import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/Feedback/feedback_controller.dart';
import 'package:bookatease/Modules/Feedback/feedback_repository.dart';
import 'package:get/get.dart';

class FeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedBackController>(
        () => FeedBackController(FeedbackProfileRepository(ApiManager())));
  }
}
