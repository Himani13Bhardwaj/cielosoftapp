import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/custom_widget.dart';

class AppTeam extends StatelessWidget {
  const AppTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: "App Team",
      isBackArrow: true,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.mediumGreyColor),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 64,
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: CustomWidget.text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          fontSize: 10.0,
                          maxLine: 20,
                          textAlign: TextAlign.justify,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.mediumGreyColor),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 64,
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: CustomWidget.text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          fontSize: 10.0,
                          maxLine: 20,
                          textAlign: TextAlign.justify,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.mediumGreyColor),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidget.text(
                        "Contact Us",
                        fontSize: 12.0,
                        maxLine: 20,
                        textAlign: TextAlign.justify,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomWidget.text(
                        "Connect with us on below share channel or drop a message to the email.",
                        fontSize: 10.0,
                        maxLine: 20,
                        textAlign: TextAlign.justify,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
