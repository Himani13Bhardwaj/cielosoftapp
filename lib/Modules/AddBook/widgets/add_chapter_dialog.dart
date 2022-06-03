import 'package:bookatease/Modules/AddBook/add_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/constant.dart';
import '../../../Utils/custom_widget.dart';

class AddChapterDialog extends StatelessWidget {
  AddChapterDialog({Key? key}) : super(key: key);

  AddBookController addBookController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: addBookController.chapterNameTextEditingController,
          cursorColor: AppColor.primaryColor,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Please enter chapter name';
            }
            return null;
          },
          decoration: CustomWidget.customInputDecoration(
              hintText: 'Enter chapter name'),
        ),
        SizedBox(height: 2.0.h),
        TextFormField(
          controller: addBookController.chapterNumberTextEditingController,
          cursorColor: AppColor.primaryColor,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Please chapter number';
            }
            return null;
          },
          decoration: CustomWidget.customInputDecoration(
              hintText: 'Enter chapter number'),
        ),
        SizedBox(height: 2.0.h),
        TextFormField(
          controller: addBookController.chapterURLTextEditingController,
          cursorColor: AppColor.primaryColor,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Please chapter URL';
            }
            return null;
          },
          decoration:
              CustomWidget.customInputDecoration(hintText: 'Enter chapter URL'),
        ),
        SizedBox(height: 3.5.h),
        Obx(
          () => addBookController.selectedFilePath.isEmpty
              ? CustomWidget.customButton(
                  callBack: () {
                    addBookController.openFilePicker();
                  },
                  height: 5.0.h,
                  width: 30.0.w,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                  textColor: AppColor.whiteColor,
                  btnText: "Add File")
              : CustomWidget.text(
                  addBookController.selectedFileName.value,
                  fontSize: 14.0,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                ),
        ),
        SizedBox(height: 2.0.h),
      ],
    );
  }
}
