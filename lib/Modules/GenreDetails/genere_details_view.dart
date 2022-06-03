import 'package:bookatease/Modules/GenreDetails/genere_detail_controller.dart';
import 'package:bookatease/Modules/ReaderDashboard/reader_dashboard_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/Widgets/book_widget.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GenreDetailsScreen extends GetView<GenreDetailsController> {
  const GenreDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: 'Genre Details',
      isBackArrow: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children:  [
                    const CircleAvatar(backgroundImage:  AssetImage(Assets.imagesDummyImage), radius: 70,),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWidget.text("Genre Name",
                            fontWeight: FontWeight.w600, fontSize: 13),
                        CustomWidget.text("Genre Short Description",
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColor.darkGrey),

                      ],
                    ),
                    const Spacer(),

                  ],
                ),
                

                SizedBox(height: 2.0.h),
                Column(
                  children: [
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 2.0.h),
                    CustomWidget.text("Books", fontWeight: FontWeight.bold),
                    SizedBox(height: 2.0.h),

                    const BookWidget(shrinkWrap: true,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _customTitleValue({required String title, required String value}) {
    return Column(
      children: [
        CustomWidget.text(title,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColor.darkGrey),
        CustomWidget.text(value, fontSize: 12, fontWeight: FontWeight.bold),
      ],
    );
  }
}
