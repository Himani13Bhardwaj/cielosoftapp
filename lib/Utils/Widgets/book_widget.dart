import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookWidget extends GetView<ReaderDashboardController> {
  final bool shrinkWrap;

  const BookWidget({Key? key, this.shrinkWrap = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        shrinkWrap: shrinkWrap,
        physics: shrinkWrap
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(right: 18.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            childAspectRatio: 0.65,
            mainAxisSpacing: 20.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => controller.loginController.isReader
                ? Get.toNamed(Routes.bookDetailsScreen)
                : Get.toNamed(Routes.updateBookScreen),
            child: PhysicalModel(
              color: AppColor.whiteColor,
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: CustomWidget.customAssetImageWidget(
                        image: Assets.imagesDummyImage,
                        height: 20.0,
                        width: 100.0,
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomWidget.text(
                          "My Life My Rule",
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                        if (!controller.loginController.isReader)
                          CustomWidget.text(
                            "Book Status",
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        if (!controller.loginController.isReader)
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "Delete",
                                    content: const Text(
                                      "Are you sure you want to delete My Life My Rule?",
                                      textAlign: TextAlign.center,
                                    ),
                                    contentPadding: const EdgeInsets.all(24),
                                    textConfirm: "Yes",
                                    textCancel: "No",
                                    confirmTextColor: AppColor.whiteColor,
                                    onConfirm: () {
                                      Get.back();
                                    });
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Icon(
                                  Icons.delete,
                                  color: AppColor.blackColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
