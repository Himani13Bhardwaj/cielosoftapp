import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/Widgets/book_widget.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReaderDashboardScreen extends GetView<ReaderDashboardController> {
  const ReaderDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: 'BookAtEase',
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 28, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:16,right: 18.0, left: 18),
                child: PhysicalModel(
                  color: AppColor.whiteColor,
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: TextFormField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.whiteColor,
                      isDense: true,
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 20, maxHeight: 15),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Image.asset(
                          Assets.imagesSearchIcon,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: 'Search Book',
                      hintStyle: TextStyle(
                          fontSize: 12.0.sp,
                          letterSpacing: 0.5,
                          fontFamily: 'SFProText',
                          color: AppColor.textPrimaryColor.withOpacity(0.5)),
                      contentPadding:
                          const EdgeInsets.only(top: 15, bottom: 15, right: 0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.0.h),

              ///
              /// Author Based Collection
              ///
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: CustomWidget.text(
                  "Categories",
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  color: AppColor.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    categoryChip("New", Assets.iconsLatestbook),
                    categoryChip("Author", Assets.iconsIcUser),
                    categoryChip("Genre", Assets.iconsCategories),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Obx(() => controller.getWidget()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  categoryChip(String name, String icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeCategory(controller.getCategory(name)),
        child: Obx(
          () => Container(
              // height: 5.0.h,
              width: 30.0.w,
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.all(5),
              decoration: CustomWidget.customBoxDecoration(
                  borderRadius: 25,
                  color:
                      controller.getCategoryName(controller.selectedCategory) ==
                              name
                          ? AppColor.primaryColor.withOpacity(0.5)
                          : AppColor.darkGrey.withOpacity(0.1),
                  borderWidth: 0,
                  isBoxShadow: true),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      radius: 20,
                      child: Image.asset(
                        icon,
                        height: 25,
                        width: 25,
                      )),
                  const SizedBox(width: 10),
                  Center(
                    child: CustomWidget.text(name,
                        fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
