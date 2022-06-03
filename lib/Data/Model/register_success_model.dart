class RegisterSuccessModel {
  String? response;
  String? email;
  String? username;
  int? pk;
  String? token;

  RegisterSuccessModel(
      {this.response, this.email, this.username, this.pk, this.token});

  RegisterSuccessModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    email = json['email'];
    username = json['username'];
    pk = json['pk'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    data['email'] = email;
    data['username'] = username;
    data['pk'] = pk;
    data['token'] = token;
    return data;
  }
}
