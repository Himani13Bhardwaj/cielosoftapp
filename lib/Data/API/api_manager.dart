import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bookatease/Data/Model/error_model.dart';
import 'package:bookatease/Utils/constant.dart';
import 'package:bookatease/Utils/custom_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

const String jsonContentType = 'application/json';

///
/// This class contain the Comman methods of API
///
class ApiManager {
  ///
  /// Replace base url with this
  ///
  static const String baseUrl = "https://cielosoft-bookhunt.herokuapp.com/api/";

  ///
  /// This method is used for call API for the `GET` method, need to pass API Url endpoint
  ///
  Future<dynamic> get(String url, {bool isLoaderShow = true}) async {
    Get.printInfo(info: 'Api Get, url $url');
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request
      ///
      Map<String, String> header = {
        // "session": LoginSuccessResponseModel.fromJson(
        //         GetStorage().read(AppPreferencesHelper.pUser))
        //     .session!
      };

      Get.printInfo(info: 'header- ${header.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');

      ///
      /// Make get method api call
      ///
      final response =
          await http.get(Uri.parse(baseUrl + url), headers: header);

      ///
      /// Handle response and errors
      ///
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      Get.printInfo(info: 'No net');
      throw FetchDataException('No Internet connection');
    } finally {
      if (isLoaderShow) {
        EasyLoading.dismiss();
      }
    }
  }

  ///
  /// This method is used for call API for the `POST` method, need to pass API Url endpoint
  ///
  Future<dynamic> post(String url, var parameters,
      {String objcontentType = jsonContentType,
      bool isLoaderShow = true,
      bool isErrorSnackShow = true}) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      Map<String, String> header =
          GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  // "session": LoginSuccessResponseModel.fromJson(
                  //         GetStorage().read(AppPreferencesHelper.pUser))
                  //     .session!,
                  'Content-Type': 'application/json',
                };

      Get.printInfo(info: 'header- ${header.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');

      ///
      /// Make the post method api call with header and given parameter
      ///
      final response = await http.post(Uri.parse(baseUrl + url),
          headers: header, body: parameters);
      Get.printInfo(info: response.body);

      ///
      /// Handle response and errors
      ///
      Map<dynamic, dynamic> map =
          _returnResponse(response, isShow: isErrorSnackShow);

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      CustomWidget.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  dynamic _returnResponse(http.Response response, {bool isShow = true}) {
    EasyLoading.dismiss();
    print(response.body);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        if (responseJson['status'] == false) {
          throw BadRequestException(responseJson['message']);
        }
        return responseJson;
      case 400:
        if (isShow) {
          CustomWidget.errorSnackBar(content:ErrorModel.fromJson(json.decode(response.body.toString())).errorMessage!);
        }
        throw BadRequestException(ErrorModel.fromJson(json.decode(response.body.toString())).errorMessage);
      case 401:
        if (isShow) {
          CustomWidget.errorSnackBar(content: ErrorModel.fromJson(json.decode(response.body.toString())).errorMessage!);
        }
        GetStorage().erase();
        // Get.offAllNamed(Routes.loginScreen);

        throw BadRequestException(ErrorModel.fromJson(json.decode(response.body.toString())).errorMessage);
      case 403:
        Get.printInfo(info: "Hello");
        throw UnauthorisedException(ErrorModel.fromJson(json.decode(response.body.toString())).errorMessage);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
