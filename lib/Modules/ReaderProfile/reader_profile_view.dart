import 'package:bookatease/Modules/ReaderBookmark/reader_bookmark_controller.dart';
import 'package:bookatease/Modules/ReaderProfile/Widgets/app_info.dart';
import 'package:bookatease/Modules/ReaderProfile/Widgets/app_info.dart';
import 'package:bookatease/Modules/ReaderProfile/Widgets/app_team.dart';
import 'package:bookatease/Modules/ReaderProfile/Widgets/claim_coins.dart';
import 'package:bookatease/Modules/ReaderProfile/Widgets/custom_list_tile.dart';
import 'package:bookatease/Modules/ReaderProfile/Widgets/user_info.dart';
import 'package:bookatease/Modules/ReaderProfile/reader_profile_controller.dart';
import 'package:bookatease/Routes/routes.dart';
import 'package:bookatease/Utils/Widgets/background_wrapper.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:bookatease/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class ReaderProfileScreen extends GetView<ReaderProfileController> {
  const ReaderProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      title: 'Profile',
      child: Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: 100.0.w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 64,
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "John Doe",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.dividerColor, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Text("Collected Points: 100"),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.dividerColor, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Text("Logout"),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SwitchListTile(
                      value: GetStorage().read(
                            AppPreferencesHelper.pUserMode,
                          ) ??
                          true,
                      title: CustomWidget.text(
                        "Write/Reader",
                        fontWeight: FontWeight.w700,
                        color: AppColor.textPrimaryColor,
                        textAlign: TextAlign.left,
                        fontSize: 12,
                      ),
                      subtitle: Text(
                        GetStorage().read(
                                  AppPreferencesHelper.pUserMode,
                                ) ??
                                true
                            ? 'Current Mode: Reader'
                            : 'Current Mode: Writer',
                      ),
                      activeColor: AppColor.greenColor,
                      secondary: const Icon(
                        Icons.settings_outlined,
                        color: AppColor.blackColor,
                      ),
                      onChanged: (v) {
                        if (GetStorage().read(
                              AppPreferencesHelper.pUserMode,
                            ) ??
                            true) {
                          controller.switchToWriter();
                        } else {
                          controller.switchToReader();
                        }
                      },
                    ),
                  ),
                  CustomListTile(
                    iconData: Icons.person_outline_rounded,
                    title: 'User Info',
                    onTap: () => Get.to(
                      () => const UserInfo(),
                    ),
                  ),
                  CustomListTile(
                    iconData: Icons.hub_outlined,
                    title: 'Claim Coins',
                    onTap: () {
                      Get.to(()=>const ClaimCoins());
                    },
                  ),
                  CustomListTile(
                    iconData: Icons.info_outline,
                    title: 'App Team',
                    onTap: () {
                      Get.to(
                        const AppTeam(),
                        transition: Transition.cupertino,
                      );
                    },
                  ),CustomListTile(
                    iconData: Icons.info_outline,
                    title: 'App Information',
                    onTap: () {
                      Get.to(
                        const AppInformation(),
                        transition: Transition.cupertino,
                      );
                    },
                  ),
                  CustomListTile(
                    iconData: Icons.assistant_outlined,
                    title: 'Feedback',
                    onTap: () {
                      Get.toNamed(Routes.feedBackScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
