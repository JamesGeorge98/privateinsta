

class SignInModel {
  String? userName;
  String? uuid;

  SignInModel({this.userName, this.uuid});

  SignInModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['uuid'] = uuid;
    return data;
  }
}
