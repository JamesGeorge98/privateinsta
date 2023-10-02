class SignInModel {
  SignInModel({this.userName, this.uuid});

  SignInModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'] as String? ?? '';
    uuid = json['uuid'] as String? ?? '';
  }
  String? userName;
  String? uuid;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['uuid'] = uuid;
    return data;
  }
}
