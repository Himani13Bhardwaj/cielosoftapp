import 'package:bookatease/Modules/ReaderBookmark/reader_bookmark_controller.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/Widgets/book_widget.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReaderBookmarkScreen extends GetView<ReaderBookmarkController> {
  const ReaderBookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: 'Favourite',
      child: Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              TabBar(
                physics: const BouncingScrollPhysics(),
                indicatorColor: AppColor.primaryColor,
                labelColor: AppColor.primaryColor,
                padding: EdgeInsets.zero,
                unselectedLabelColor: AppColor.textPrimaryColor,
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    CustomWidget.selectedLabelStyle(fontW: FontWeight.w600),
                unselectedLabelStyle:
                    CustomWidget.selectedLabelStyle(fontW: FontWeight.w400),
                controller: controller.tabController,
                tabs: controller.myTabs,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 18, 0, 0),
                  child: TabBarView(
                    controller: controller.tabController,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      BookWidget(),
                      BookWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: const [
        //       Expanded(child: BookWidget()),
        //       SizedBox(height: 15),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
