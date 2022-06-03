import 'package:bookatease/Modules/WriterDashboard/writer_dashboard_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/Widgets/book_widget.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WriterDashboardScreen extends GetView<WriterDashboardController> {
  const WriterDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: 'BookAtEase',
      child: Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        resizeToAvoidBottomInset: false ,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.addBookScreen);
          },
          backgroundColor: AppColor.primaryColor,
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              PhysicalModel(
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
              SizedBox(height: 2.0.h),
              const Expanded(child: BookWidget()),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
