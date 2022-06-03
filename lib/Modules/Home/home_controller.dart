import 'package:bookatease/Modules/Home/home_repository.dart';
import 'package:bookatease/Modules/ReaderBookmark/reader_bookmark_controller.dart';
import 'package:bookatease/Modules/ReaderBookmark/reader_bookmark_view.dart';
import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_view.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_view.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/API/api_manager.dart';
import '../ReaderBookmark/reader_bookmark_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  HomeController(this.repository);
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  ReaderBookmarkController readerBookmarkController =
      Get.put(ReaderBookmarkController(ReaderBookmarkRepository(ApiManager())));

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
      const ReaderDashboardScreen(),
      const ReaderBookmarkScreen(),
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
            image: Assets.iconsBookmarkWhite, height: 3.0, width: 3.0),
        activeIcon: CustomWidget.customAssetImageWidget(
            image: Assets.iconsBookmarkWhiteSelected, height: 3.0, width: 3.0),
        label: "Favourite",
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
