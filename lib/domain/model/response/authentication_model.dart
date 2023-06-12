import 'package:jojo_taxi/domain/model/response/base_model.dart';

class AuthenticationModal {
  ErrorModal? errormodal;
  TokenModal? tokenModal;

  AuthenticationModal({this.errormodal, this.tokenModal});

  AuthenticationModal.fromJson(Map<String, dynamic> json) {
    errormodal = ErrorModal.fromJson(json['error']);
    tokenModal = TokenModal.fromJson(json['data']);
  }
}

class TokenModal {
  String? new_access_token;
  String? new_refresh_token;

  TokenModal({this.new_access_token, this.new_refresh_token});

  TokenModal.fromJson(Map<String, dynamic> json) {
    new_access_token = json['new_access_token'];
    new_refresh_token = json['new_refresh_token'];
  }
}
