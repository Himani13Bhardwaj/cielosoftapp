import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ClaimCoins extends StatelessWidget {
  const ClaimCoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: 'Claim Coins',
      isBackArrow: true,
      child: Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        body: SizedBox(
          width: 100.0.w,
          child: Column(
            children: [
              SizedBox(height: 10.0.h),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.dividerColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: const Text(
                        "15 Min",
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.timer,
                      color: AppColor.greenColor,
                    ),
                    Expanded(child: Container()),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.greenColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 8),
                      child: const Text(
                        "Claim",
                        style: TextStyle(color: AppColor.whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.dividerColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: const Text(
                        "30 Min",
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.timer,
                      color: AppColor.greenColor,
                    ),
                    Expanded(child: Container()),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.greenColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 8),
                      child: const Text(
                        "Claim",
                        style: TextStyle(color: AppColor.whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.dividerColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: const Text(
                        "60 Min",
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.timer,
                      color: AppColor.greenColor,
                    ),
                    Expanded(child: Container()),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.greenColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 8),
                      child: const Text(
                        "Claim",
                        style: TextStyle(color: AppColor.whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              CustomWidget.customButton(
                callBack: () {},
                height: 48,
                width: 80.0.w,
                btnText: "Purchase Coins",
                textColor: AppColor.whiteColor,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
