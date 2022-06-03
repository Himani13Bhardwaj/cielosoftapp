class ErrorModel {
  String? errorMessage;
  String? response;

  ErrorModel({this.errorMessage, this.response});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errorMessage = json['error_message'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_message'] = errorMessage;
    data['response'] = response;
    return data;
  }
}
