import 'package:bookatease/Modules/AddBook/widgets/chapter_list.dart';
import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class BookDetailsScreen extends GetView<ReaderDashboardController> {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: 'Book Details',
      isBackArrow: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: !controller.loginController.isReader
            ? CustomWidget.customButton(
                callBack: () {
                  Get.toNamed(Routes.updateBookScreen);
                },
                height: 7.0.h,
                width: 50.0.w,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                textColor: AppColor.whiteColor,
                btnText: "Edit Book",
              )
            : Container(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //   width: width.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      Assets.imagesDummyImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: controller.loginController.isReader
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.start,
                      children: [
                        CustomWidget.text("A Man With One Of Those Face",
                            fontWeight: FontWeight.w600, fontSize: 13),
                        CustomWidget.text("Author: Comie Mcdnial ",
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColor.darkGrey),
                        CustomWidget.text("Genre: Comedy",
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColor.darkGrey),
                      ],
                    ),
                    controller.loginController.isReader
                        ? const Spacer()
                        : Container(),
                    controller.loginController.isReader
                        ? Obx(() => IconButton(
                            onPressed: () => controller.toggleBookMark(),
                            icon: controller.bookMark
                                ? const Icon(Icons.bookmark)
                                : const Icon(Icons.bookmark_border)))
                        : Container()
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: AppColor.darkGrey.withOpacity(0.5))),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _customTitleValue(
                          title: Icons.remove_red_eye_outlined, value: "11k"),
                      _customTitleValue(title: Icons.comment, value: "1k"),
                      _customTitleValue(
                          title: Icons.thumb_up_alt_outlined, value: "5k"),
                      _customTitleValue(
                          title: Icons.thumb_down_alt_outlined, value: "1k"),
                    ],
                  ),
                ),
                SizedBox(height: 2.0.h),
                Column(
                  children: [
                    const Text(
                      "Lorem ipsum dolor sit amet, consecrated advising elite, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 3.0.h),
                    CustomWidget.customButton(
                        callBack: () => Get.toNamed(Routes.chapListScreen),
                        height: 7.0.h,
                        width: 50.0.w,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                        textColor: AppColor.whiteColor,
                        btnText: "START READING"),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomWidget.text("Comments",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    CustomWidget.text('Add comment',
                        fontSize: 10.0,
                        color: AppColor.darkGrey,
                        fontWeight: FontWeight.w500),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // controller: controller
                            //     .usernameTextEditingController,
                            cursorColor: AppColor.primaryColor,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            decoration: CustomWidget.customInputDecoration(
                                hintText: 'Write something'),
                          ),
                        ),
                        const Icon(
                          Icons.send,
                          color: AppColor.primaryColor,
                        )
                      ],
                    ),
                    SizedBox(height: 2.0.h),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColor.primaryColor,
                          ),
                          SizedBox(width: 1.0.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomWidget.text("Name",
                                  fontSize: 10, fontWeight: FontWeight.bold),
                              CustomWidget.text(
                                  "Content of comments Lorrem ipsim dolor sir amet",
                                  fontSize: 8,
                                  maxLine: 2)
                            ],
                          )
                        ],
                      ),
                      separatorBuilder: (context, i) => const Divider(),
                      itemCount: 10,
                    ),
                    SizedBox(height: 5.0.h),
                  ],
                ),
                SizedBox(height: 3.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _customTitleValue({required IconData title, required String value}) {
    return Row(
      children: [
        Icon(title),
        const SizedBox(width: 8),
        CustomWidget.text(value, fontSize: 12, fontWeight: FontWeight.bold),
      ],
    );
  }
}
