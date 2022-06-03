import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreWidget extends GetView<ReaderDashboardController> {
  const GenreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.genreList.length,
        padding: const EdgeInsets.only(right: 18.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            childAspectRatio: 0.65,
            mainAxisSpacing: 20.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.genreDetailsScreen),
            child: PhysicalModel(
              elevation: 5,shadowColor: Colors.grey.withOpacity(0.4),

              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: CustomWidget.customAssetImageWidget(
                          image: Assets.imagesBookatease,
                          height: 25.0,
                          width: 100.0,
                          fit: BoxFit.cover)),
                  Expanded(

                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomWidget.text(controller.genreList[index],
                              fontWeight: FontWeight.bold, fontSize: 10),
                          // CustomWidget.text("John Deo",
                          //     fontWeight: FontWeight.w400,
                          //     // textAlign: TextAlign.start,
                          //     fontSize: 10,
                          //     // maxLine: 2,
                          //     textOverflow: TextOverflow.fade),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ); });
  }
}
