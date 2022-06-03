import 'package:bookatease/Routes/pages.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/controller_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookAtEase',
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        initialBinding: MyControllerBindings(),
        theme: ThemeData(
          primarySwatch: AppColor.themeColor,
          fontFamily: 'SFProText',
        ),
        builder: EasyLoading.init(),
      );
    });
  }
}
