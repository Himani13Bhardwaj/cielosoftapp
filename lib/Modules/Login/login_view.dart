import 'package:bookatease/Modules/Login/login_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.whiteColor,
        body: Stack(
          children: [
            SizedBox(
              height: 100.0.h,
              width: 100.0.w,
              child: CustomWidget.customAssetImageWidget(
                  image: Assets.imagesLoginbackground,fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0.h,
                    child: Column(
                      children: [
                        const Spacer(),
                      Image.asset(Assets.imagesLogo,height: 100,),
                        SizedBox(height: 1.0.h),
                        Center(
                          child: CustomWidget.text('BookAtEase',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: AppColor.whiteColor),
                        ),

                        const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Form(
                      key: controller.loginFromKey,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 2.0.h, top: 2.5.h, right: 2.5.h),
                              // decoration: const BoxDecoration(
                              //     color: AppColor.whiteColor,
                              //     borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(50))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.0.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: CustomWidget.text('Email Address',
                                        fontSize: 10.0,
                                        color: AppColor.darkGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 8.0.h,
                                    child: TextFormField(
                                      controller:
                                          controller.emailTextEditingController,
                                      cursorColor: AppColor.primaryColor,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter the email address';
                                        }
                                        if (!GetUtils.isEmail(value)) {
                                          return 'Please enter valid email address';
                                        }
                                        return null;
                                      },
                                      decoration:
                                          CustomWidget.customInputDecoration(
                                              hintText: 'Email'),
                                    ),
                                  ),
                                  SizedBox(height: 1.0.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: CustomWidget.text('Password',
                                        fontSize: 10.0,
                                        color: AppColor.darkGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 8.0.h,
                                    child: TextFormField(
                                      controller: controller
                                          .passwordTextEditingController,
                                      obscureText: true,
                                      cursorColor: AppColor.primaryColor,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter the password';
                                        }
                                        if (value.length < 6) {
                                          return 'Password should be more than 6 character';
                                        }
                                        return null;
                                      },
                                      decoration:
                                          CustomWidget.customInputDecoration(
                                              hintText: 'Password'),
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Center(
                                      child: CustomWidget.customButton(
                                          callBack: () {
                                            if (controller.otpSent) {
                                              controller.login();
                                            } else {
                                              controller.sendOtp();
                                            }
                                          },
                                          height: 7.0.h,
                                          width: 100.0.w,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryColor,
                                          textColor: AppColor.whiteColor,
                                          btnText: "LOGIN")),
                                  SizedBox(height: 1.0.h),
                                  Center(
                                      child: CustomWidget.text("OR",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10)),

                                  SizedBox(height: 1.0.h),
                                  Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 6.0.h,
                                        width: 100.0.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          border: Border.all(
                                              color: AppColor.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomWidget
                                                  .customAssetImageWidget(
                                                      image: Assets
                                                          .imagesSmartphone,
                                                      height: 2.0),
                                              CustomWidget.text(
                                                  "Login With Mobile",
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.primaryColor),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:1.0.h),
                                  Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () => controller.login(),
                                      child: Container(
                                        height: 6.0.h,
                                        width: 100.0.w,
                                        decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          border: Border.all(
                                              color: AppColor.primaryColor),
                                          borderRadius:
                                          BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              CustomWidget
                                                  .customAssetImageWidget(
                                                  image: Assets
                                                      .iconsGoogleIcon,
                                                  height: 1.5),
                                              CustomWidget.text(
                                                  "Login With Google",
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.primaryColor),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.0.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomWidget.text(
                                          "Don't have an account? ",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      GestureDetector(
                                        onTap: () => Get.toNamed(
                                            Routes.registrationScreen),
                                        child: CustomWidget.text("SIGN UP",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: AppColor.greenColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.0.h),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
