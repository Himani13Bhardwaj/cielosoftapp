import 'package:bookatease/Modules/AddBook/add_book_view.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/constant.dart';
import '../../../Utils/custom_widget.dart';
import '../add_book_controller.dart';
import '../model/add_book_model.dart';
import 'add_chapter_dialog.dart';

class ChapterList extends GetView<AddBookController> {
  ChapterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: "Add Chapter",
      isBackArrow: true,
      actionItem: InkWell(
        onTap: () {
          Get.offAllNamed(Routes.writerHomeScreen);
        },
        child: const Icon(
          Icons.done,
          size: 24,
          color: AppColor.whiteColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
              content: AddChapterDialog(),
              title: 'Add Chapter',
              titleStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 18.0,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              confirm: CustomWidget.customButton(
                callBack: () {
                  controller.addedChapterList.add(AddBookModel(
                    controller.chapterNameTextEditingController.text,
                    controller.chapterNumberTextEditingController.text,
                    controller.chapterURLTextEditingController.text,
                    controller.selectedFileName.value,
                    controller.selectedFilePath.value,
                  ));
                  controller.chapterNameTextEditingController.clear();
                  controller.chapterNumberTextEditingController.clear();

                  controller.chapterURLTextEditingController.clear();
                  controller.selectedFileName.value = '';
                  controller.selectedFilePath.value = '';

                  Get.back();
                },
                height: 5.0.h,
                width: 30.0.w,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                textColor: AppColor.whiteColor,
                btnText: "Save",
              ),
              cancel: CustomWidget.customButton(
                callBack: () {
                  Get.back();
                },
                height: 5.0.h,
                width: 30.0.w,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                textColor: AppColor.whiteColor,
                btnText: "Cancel",
              ),
            );
          },
          backgroundColor: AppColor.primaryColor,
          child: const Icon(
            Icons.add,
            color: AppColor.whiteColor,
          ),
        ),
        // appBar: AppBar(
        //     backgroundColor: AppColor.whiteColor,
        //     elevation: 0,
        //     centerTitle: true,
        //     leading: IconButton(
        //       onPressed: () {
        //         Get.back();
        //       },
        //       icon: const Icon(
        //         Icons.arrow_back_ios_new_outlined,
        //         color: AppColor.blackColor,
        //       ),
        //     ),
        //     title: CustomWidget.text("Chapter List",
        //         fontSize: 14.0,
        //         color: AppColor.blackColor,
        //         fontWeight: FontWeight.bold)),
        body: Obx(
          () => controller.addedChapterList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 24.0,left: 16,right: 16),
                  child: ListView.separated(
                    itemCount: controller.addedChapterList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 1.5.h,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 190, 231, 200),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomWidget.text(
                                'Chapter Title : ' +
                                    controller
                                        .addedChapterList[index].chapterName!,
                                fontSize: 16.0,
                                textAlign: TextAlign.start,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.bold),
                            CustomWidget.text(
                                'Chapter Number : ' +
                                    controller
                                        .addedChapterList[index].chapterNumber!,
                                fontSize: 12.0,
                                textAlign: TextAlign.start,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w400),
                            // CustomWidget.text(
                            //   'File Name : ' +
                            //       controller.addedChapterList[index]
                            //           .selectedFileName!,
                            //   fontSize:   13.0,
                            //   textAlign: TextAlign.start,
                            //   color: AppColor.blackColor,
                            //   fontWeight: FontWeight.w400,
                            // )
                          ],
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: CustomWidget.text('Please add chapter',
                      fontSize: 14.0,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w400),
                ),
        ),
      ),
    );
  }
}
