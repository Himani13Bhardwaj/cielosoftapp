import 'package:bookatease/Modules/WriterHome/writer_home_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriterHomeScreen extends GetView<WriterHomeController> {
  const WriterHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (int index) => controller.changeIndex(index),
          selectedItemColor: AppColor.primaryColor,
          type: BottomNavigationBarType.fixed,
          items: controller.navBarsItems())),
      body: Obx(() => controller.buildScreens()[controller.selectedIndex]),
    );
  }
}
