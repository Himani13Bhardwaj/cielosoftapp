import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Modules/Login/login_repository.dart';
import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_controller.dart';
import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_repository.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_controller.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_repository.dart';
import 'package:bookatease/Modules/WriterHome/writer_home_controller.dart';
import 'package:bookatease/Modules/WriterHome/writer_home_repository.dart';
import 'package:get/get.dart';

class WriterHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReaderDashboardController>(
            ReaderDashboardController(ReaderDashboardRepository(ApiManager())));
    Get.lazyPut<LoginController>(
            () => LoginController(LoginRepository(ApiManager())));
    Get.lazyPut<WriterHomeController>(
            () => WriterHomeController(WriterHomeRepository(ApiManager())));
    Get.lazyPut(()=>ReaderProfileController(ReaderProfileRepository(ApiManager())));


  }
}
