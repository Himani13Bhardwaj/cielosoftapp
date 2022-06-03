import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isBackArrow;
  final double padding;
  final Widget? actionItem;

  const BackgroundWrapper({
    Key? key,
    required this.child,
    required this.title,
    this.padding = 13.0,
    this.isBackArrow = false,
    this.actionItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: padding.h),
            child: child,
          ),
          SizedBox(
            height: 20.0.h,
            width: 100.0.w,
            child: CustomWidget.customAssetImageWidget(
                image: Assets.imagesRegistrationBackground, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: isBackArrow
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                SizedBox(width: isBackArrow ? 18 : 0),
                isBackArrow
                    ? InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColor.whiteColor,
                        ),
                      )
                    : const SizedBox(),
                SizedBox(width: isBackArrow ? 18 : 0),
                Expanded(
                  child: CustomWidget.text(
                    title,
                    fontSize: 14.0,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.bold,
                    textAlign: isBackArrow ? TextAlign.start : TextAlign.center,
                  ),
                ),
                if (actionItem != null)
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: actionItem,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
