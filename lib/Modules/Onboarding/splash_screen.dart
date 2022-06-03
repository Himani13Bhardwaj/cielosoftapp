import 'dart:async';

import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Modules/Login/login_repository.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginController loginController =
      Get.put<LoginController>(LoginController(LoginRepository(ApiManager())));

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      if (GetStorage().read(AppPreferencesHelper.pUser) != null) {
        if (loginController.isReader) {
          Get.offAllNamed(Routes.homeScreen);
        } else {
          Get.offAllNamed(Routes.writerHomeScreen);
        }
      } else {
        if (loginController.isReader) {
          Get.offAllNamed(Routes.homeScreen);
        } else {
          Get.offAllNamed(Routes.writerHomeScreen);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SizedBox(
        height: 100.0.h,
        width: 100.0.w,
        child: Center(
          child: CustomWidget.customAssetImageWidget(
              image: Assets.imagesLogo, height: 18.0, width: 18.0),
        ),
      ),
    );
  }
}
