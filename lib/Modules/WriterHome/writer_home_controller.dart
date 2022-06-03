import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_view.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_view.dart';
import 'package:bookatease/Modules/WriterDashboard/writer_dashboard_view.dart';
import 'package:bookatease/Modules/WriterHome/writer_home_repository.dart';
import 'package:bookatease/Modules/WriterHome/writer_home_view.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriterHomeController extends GetxController {
  final WriterHomeRepository repository;

  WriterHomeController(this.repository);

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  changeIndex(value) async {
    _selectedIndex.value = value;
    if (value == 1) {

    } else if (value == 2) {

    } else {}
  }

  ///
  /// This method return the screen according to tab selection from bottomNavigationBar
  ///
  List<Widget> buildScreens() {
    return [
      const WriterDashboardScreen(),
       const ReaderProfileScreen(),
    ];
  }

  ///
  /// This method returns the navBarItems
  ///
  List<BottomNavigationBarItem> navBarsItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: CustomWidget.customAssetImageWidget(
            image: Assets.iconsHome, height: 3.0, width: 3.0),
        activeIcon: CustomWidget.customAssetImageWidget(
            image: Assets.iconsHomeSelected, height: 3.0, width: 3.0),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: CustomWidget.customAssetImageWidget(
            image: Assets.iconsUser, height: 3.0, width: 3.0),
        activeIcon: CustomWidget.customAssetImageWidget(
            image: Assets.iconsUserSelected, height: 3.0, width: 3.0),
        label: "Profile",
      ),
    ];
  }
}
