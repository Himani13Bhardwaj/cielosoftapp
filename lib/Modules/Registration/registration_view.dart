import 'package:bookatease/Modules/Registration/registration_controller.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.whiteColor,
        body: BackgroundWrapper(
          title: 'Create Account',
          isBackArrow: true,
          padding: 0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15.0.h,
                  child: Row(
                    children: [
                      SizedBox(width: 1.0.h),
                      GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            CupertinoIcons.back,
                            color: AppColor.whiteColor,
                            size: 3.0.h,
                          )),
                      Spacer(),
                      Center(
                        child: CustomWidget.text('Create Account',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: AppColor.whiteColor),
                      ),
                      SizedBox(width: 3.0.h),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85.0.h,
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.registrationFromKey,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Container(
                              padding: EdgeInsets.only(
                                  left: 2.0.h, top: 2.5.h, right: 2.5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 10.0),
                                    child: CustomWidget.text('Name',
                                        fontSize: 10.0,
                                        color: AppColor.darkGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextFormField(
                                    controller:
                                    controller.nameTextEditingController,
                                    cursorColor: AppColor.primaryColor,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                    decoration:
                                    CustomWidget.customInputDecoration(
                                        hintText: 'Name '),
                                  ),
                                  SizedBox(height: 2.5.h),

                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10.0),
                                    child: CustomWidget.text('Username',
                                        fontSize: 10.0,
                                        color: AppColor.darkGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextFormField(
                                    controller: controller
                                        .usernameTextEditingController,
                                    cursorColor: AppColor.primaryColor,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                    decoration:
                                        CustomWidget.customInputDecoration(
                                            hintText: 'Username'),
                                  ),
                                  SizedBox(height: 2.5.h),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10.0),
                                    child: CustomWidget.text('Email Address',
                                        fontSize: 10.0,
                                        color: AppColor.darkGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextFormField(
                                    controller:
                                        controller.emailTextEditingController,
                                    cursorColor: AppColor.primaryColor,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter email address';
                                      }
                                      if (!GetUtils.isEmail(value)) {
                                        return 'Please enter the valid email address';
                                      }
                                      return null;
                                    },
                                    decoration:
                                        CustomWidget.customInputDecoration(
                                            hintText: 'Email Address'),
                                  ),
                                  SizedBox(height: 2.5.h),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10.0),
                                    child: CustomWidget.text('Password',
                                        fontSize: 10.0,
                                        color: AppColor.darkGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextFormField(
                                    controller: controller
                                        .passwordTextEditingController,
                                    cursorColor: AppColor.primaryColor,
                                    obscureText: true,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter the password';
                                      }
                                      return null;
                                    },
                                    decoration:
                                        CustomWidget.customInputDecoration(
                                            hintText: 'Password'),
                                  ),
                                  SizedBox(height: 2.5.h),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10.0),
                                    child: CustomWidget.text(
                                        'Confirm Password',
                                        fontSize: 10.0,
                                        color: AppColor.darkGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextFormField(
                                    controller: controller
                                        .confirmPasswordTextEditingController,
                                    cursorColor: AppColor.primaryColor,
                                    obscureText: true,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter the password';
                                      }
                                      if (controller
                                              .passwordTextEditingController
                                              .text !=
                                          value) {
                                        return 'Password should be same';
                                      }
                                      return null;
                                    },
                                    decoration:
                                        CustomWidget.customInputDecoration(
                                            hintText: 'Confirm Password'),
                                  ),

                                  SizedBox(height: 2.5.h),
                                  Center(
                                      child: CustomWidget.customButton(
                                          callBack: () =>
                                              controller.registerUser(),
                                          height: 7.0.h,
                                          width: 100.0.w,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryColor,
                                          textColor: AppColor.whiteColor,
                                          btnText: "SIGN UP")),
                                  SizedBox(height: 2.0.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      CustomWidget.text(
                                          "Already have an account? ",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: CustomWidget.text("LOG IN",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: AppColor.greenColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.0.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
