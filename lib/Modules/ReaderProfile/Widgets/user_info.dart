import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: 100.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  CustomWidget.text("Name",
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackColor,
                      fontSize: 10),
                  CustomWidget.text("John Doe",
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkGrey,
                      fontSize: 11),
                  const SizedBox(height: 12),
                  CustomWidget.text("Email",
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackColor,
                      fontSize: 10),
                  CustomWidget.text("john@gmail.com",
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkGrey,
                      fontSize: 11),
                  const SizedBox(height: 12),
                  CustomWidget.text("Username",
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackColor,
                      fontSize: 10),
                  CustomWidget.text("johndoe",
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkGrey,
                      fontSize: 11),
                  const SizedBox(height: 12),
                  CustomWidget.text("Username",
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackColor,
                      fontSize: 10),
                  CustomWidget.text("johndoe",
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkGrey,
                      fontSize: 11),
                  const SizedBox(height: 12),
                  CustomWidget.text(
                    "Nationality",
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
                    fontSize: 10,
                  ),
                  TextField(
                    decoration: CustomWidget.customInputDecoration(
                      hintText: 'Nationality',
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomWidget.text(
                    "Date of birth",
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
                    fontSize: 10,
                  ),
                  TextField(
                    decoration: CustomWidget.customInputDecoration(
                      hintText: '27/05/2022',
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomWidget.text(
                    "Phone",
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
                    fontSize: 10,
                  ),
                  TextField(
                    decoration: CustomWidget.customInputDecoration(
                      hintText: '+919825262753',
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  Align(
                    alignment: Alignment.center,
                    child: CustomWidget.customButton(
                      callBack: () {},
                      height: 48,
                      width: 80.0.w,
                      btnText: "Update",
                      textColor: AppColor.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
      title: 'User Info',
      isBackArrow: true,
    );
  }
}
