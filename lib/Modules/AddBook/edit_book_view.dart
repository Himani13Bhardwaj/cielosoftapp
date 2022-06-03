import 'package:bookatease/Modules/AddBook/add_book_controller.dart';
import 'package:bookatease/Modules/AddBook/model/add_book_model.dart';
import 'package:bookatease/Modules/AddBook/widgets/add_chapter_dialog.dart';
import 'package:bookatease/Modules/AddBook/widgets/chapter_list.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/constant.dart';
import '../../Utils/custom_widget.dart';

class EditBookView extends GetView<AddBookController> {
  const EditBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: "Edit Book",
      isBackArrow: true,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 32),
                TextFormField(
                  controller: controller.bookNameTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter book name';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter Book Name '),
                ),
                SizedBox(height: 2.0.h),
                TextFormField(
                  controller: controller.autherNameTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter auther\'s name';
                    }
                    return null;
                  },
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter Auther Name '),
                ),
                SizedBox(height: 2.0.h),
                TextFormField(
                  controller: controller.bookShortDescTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter books\'s short descreption';
                    }
                    return null;
                  },
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter books\'s short descreption'),
                ),
                SizedBox(height: 2.0.h),
                TextFormField(
                  controller: controller.bookCoverUrlTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter book\'s cover URL';
                    }
                    return null;
                  },
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter book\'s cover URL'),
                ),
                SizedBox(height: 2.0.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    items: [
                      "French",
                      "Italian",
                      "English",
                      "German",
                      "Hindi",
                      "Gujarati",
                      "Chinese",
                      "Korean"
                    ]
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {},
                    hint: Text(
                      "Select Language",
                      style: TextStyle(
                        color: AppColor.textPrimaryColor.withOpacity(0.5),
                      ),
                    ),
                    isExpanded: true,
                  ),
                ),
                // TextFormField(
                //   controller: controller.langTextEditingController,
                //   cursorColor: AppColor.primaryColor,
                //   textInputAction: TextInputAction.next,
                //   validator: (String? value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter langauge of book';
                //     }
                //     return null;
                //   },
                //   decoration: CustomWidget.customInputDecoration(
                //       hintText: 'Enter Langauge of book'),
                // ),
                SizedBox(height: 2.0.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    items: [
                      "Action",
                      "Comedy",
                      "Romance",
                      "Horror",
                      "Thriller",
                      "Historical",
                      "Fiction",
                    ]
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {},
                    hint: Text(
                      "Select Genre",
                      style: TextStyle(
                        color: AppColor.textPrimaryColor.withOpacity(0.5),
                      ),
                    ),
                    isExpanded: true,
                  ),
                ),
                // TextFormField(
                //   controller: controller.autherNameTextEditingController,
                //   cursorColor: AppColor.primaryColor,
                //   textInputAction: TextInputAction.next,
                //   validator: (String? value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter genre of book';
                //     }
                //     return null;
                //   },
                //   decoration: CustomWidget.customInputDecoration(
                //       hintText: 'Enter Genre Of Book'),
                // ),
                SizedBox(height: 2.0.h),
                TextFormField(
                  controller: controller.bookIntroductionTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter book\'s introduction';
                    }
                    return null;
                  },
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter Book\'s Introduction'),
                ),
                SizedBox(height: 2.0.h),
                TextFormField(
                  controller:
                      controller.authorIntroductionTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter auther\'s introduction';
                    }
                    return null;
                  },
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter Auther\'s Intoduction'),
                ),
                SizedBox(height: 2.0.h),
                TextFormField(
                  controller:
                      controller.authorIntroductionTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter copyrights of book';
                    }
                    return null;
                  },
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter Copyrights Of Book'),
                ),
                SizedBox(height: 2.0.h),
                TextFormField(
                  controller:
                      controller.authorIntroductionTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter acknowledgement of book';
                    }
                    return null;
                  },
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter Acknowledgement Of Book'),
                ),
                SizedBox(height: 2.0.h),
                TextFormField(
                  controller:
                      controller.authorIntroductionTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter policy agreement of book';
                    }
                    return null;
                  },
                  decoration: CustomWidget.customInputDecoration(
                      hintText: 'Enter Policy Agreement of Book'),
                ),
                SizedBox(height: 3.5.h),
                CustomWidget.customButton(
                  callBack: () {
                    Get.to(() => ChapterList());
                  },
                  height: 7.0.h,
                  width: 60.0.w,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                  textColor: AppColor.whiteColor,
                  btnText: "Update Book Details",
                ),
                SizedBox(height: 2.0.h),
                const Text("OR"),
                SizedBox(height: 2.0.h),
                CustomWidget.customButton(
                  callBack: () {
                    Get.to(() => ChapterList());
                  },
                  height: 7.0.h,
                  width: 60.0.w,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                  textColor: AppColor.whiteColor,
                  btnText: "Update Chapter",
                ),
                SizedBox(height: 2.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
