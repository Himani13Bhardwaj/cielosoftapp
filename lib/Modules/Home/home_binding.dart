import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/Home/home_controller.dart';
import 'package:bookatease/Modules/Home/home_repository.dart';
import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Modules/Login/login_repository.dart';
import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_controller.dart';
import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_repository.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_controller.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_repository.dart';
import 'package:bookatease/Modules/WriterDashboard/writer_dashboard_controller.dart';
import 'package:bookatease/Modules/WriterDashboard/writer_dashboard_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(HomeRepository(ApiManager())));
    Get.put(WriterDashboardController(WriterDashboardRepository(ApiManager())));
    Get.put(ReaderDashboardController(ReaderDashboardRepository(ApiManager())));
    Get.put(LoginController(LoginRepository(ApiManager())));
    Get.put(ReaderProfileController(ReaderProfileRepository(ApiManager())));
  }
}
