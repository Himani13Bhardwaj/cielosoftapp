import 'package:bookatease/Modules/Feedback/feedback_controller.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/constant.dart';
import '../../Utils/custom_widget.dart';

class FeedBackScreen extends GetView<FeedBackController> {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: "Feedback",
      isBackArrow: true,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              SizedBox(height: 10.0.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColor.mediumGreyColor),
                      ),
                      child: TextFormField(
                        controller: controller.nameTextEditingController,
                        cursorColor: AppColor.primaryColor,
                        decoration: CustomWidget.customInputDecoration(
                          hintText: 'Enter Your Name',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemSize: 20,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              SizedBox(height: 4.0.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColor.mediumGreyColor),
                ),
                child: TextFormField(
                  controller: controller.messageTextEditingController,
                  cursorColor: AppColor.primaryColor,
                  maxLines: 5,
                  decoration:
                      CustomWidget.customInputDecoration(hintText: 'Enter Message'),
                ),
              ),
              SizedBox(height: 3.0.h),
              SizedBox(height: 5.0.h),
              CustomWidget.customButton(
                callBack: () {},
                height: 7.0.h,
                width: 40.0.w,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                textColor: AppColor.whiteColor,
                btnText: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
