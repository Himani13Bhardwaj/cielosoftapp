import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CustomWidget.customAssetImageWidget(
                image: Assets.imagesLogo, height: 18.0, width: 18.0),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0.w),
              child: CustomWidget.text('Welcome To \nBookAtEase',
                  fontSize: 25.0, maxLine: 2, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            CustomWidget.customButton(
                callBack: () => Get.offAllNamed(Routes.loginScreen),
                borderRadius: 6,
                height: 7.0.h,
                width: 90.0.w,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                textColor: AppColor.whiteColor,
                btnText: "CONTINUE"),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
