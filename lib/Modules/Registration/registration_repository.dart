import 'dart:convert';

import 'package:bookatease/Data/API/api_manager.dart';
import 'package:bookatease/Data/Model/register_success_model.dart';

class RegistrationRepository {
  final ApiManager apiHelper;

  RegistrationRepository(this.apiHelper);

  Future<RegisterSuccessModel> registerApiCall(Map parameters) async {
    var jsonResponse = await apiHelper.post("account/register", json.encode(parameters));
    var response = RegisterSuccessModel.fromJson(jsonResponse);
    return response;
  }
}
