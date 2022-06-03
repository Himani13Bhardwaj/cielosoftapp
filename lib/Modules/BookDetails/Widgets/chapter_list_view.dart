import 'package:bookatease/Modules/BookDetails/book_detail_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/custom_widget.dart';
import '../../AddBook/widgets/chapter_list.dart';

class ChapterListScreen extends GetView<BookDetailsController> {
  const ChapterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        floatingActionButton: !controller.loginController.isReader
            ? CustomWidget.customButton(
                callBack: () {
                  Get.to(
                    ChapterList(),
                    transition: Transition.cupertino,
                  );
                },
                height: 7.0.h,
                width: 50.0.w,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                textColor: AppColor.whiteColor,
                btnText: "Add Chapter",
              )
            : Container(),
        body: SizedBox(
          height: !controller.loginController.isReader ? 78.0.h : 100.0.h,
          child: ListView.builder(
            itemCount: 10,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 18.0.h,
                width: 80.0.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 12.0.h,
                      width: 80.0.w,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 190, 231, 200),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            if (index < 5) {
                              Get.toNamed(Routes.readBookScreen,
                                  arguments: index + 1);
                            } else {
                              Get.defaultDialog(
                                  title:
                                      " Utilize X coins to unlock the current chapter.",
                                  middleText: "",
                                  titlePadding: const EdgeInsets.all(18),
                                  contentPadding: const EdgeInsets.all(18),
                                  actions: [
                                    Row(
                                      children: [
                                        CustomWidget.customButton(
                                            callBack: () {
                                              Get.back();
                                            },
                                            height: 7.0.h,
                                            width: 32.0.w,
                                            btnText: "Cancel",
                                            color: AppColor.primaryColor,
                                            borderRadius: 10,
                                            textColor: AppColor.whiteColor),
                                        const SizedBox(width: 15),
                                        CustomWidget.customButton(
                                            callBack: () {
                                              Get.offNamed(
                                                  Routes.readBookScreen,
                                                  arguments: index + 1);
                                            },
                                            height: 7.0.h,
                                            width: 32.0.w,
                                            btnText: "Confirm",
                                            borderRadius: 10,
                                            color: AppColor.primaryColor,
                                            textColor: AppColor.whiteColor)
                                      ],
                                    )
                                  ],
                                  titleStyle:
                                      const TextStyle(color: Colors.black),
                                  radius: 30);
                            }
                          },
                          title: CustomWidget.text('Chapter ${index + 1}',
                              fontSize: 10.0.sp,
                              textAlign: TextAlign.start,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.bold),
                          subtitle: CustomWidget.text('2nd June 2015',
                              fontSize: 8.0.sp,
                              textAlign: TextAlign.start,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 28,
                        child: index < 5
                            ? const Icon(Icons.task_alt_outlined,
                                color: AppColor.whiteColor)
                            : const Icon(
                                Icons.lock_outline_rounded,
                                color: AppColor.whiteColor,
                              ),
                        // onPressed: () {},
                        backgroundColor: AppColor.primaryColor,
                      ),
                      right: 0,
                      left: 0,
                      bottom: 0,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      title: 'Chapters',
      isBackArrow: true,
    );
  }
}
