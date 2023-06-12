class BaseModal {
  ErrorModal? errorModal;

  BaseModal({this.errorModal});

  BaseModal.fromJson(Map<String, dynamic> json) {
    errorModal = ErrorModal.fromJson(json['error']);
  }
}

class ErrorModal {
  int? code;
  String? message;

  ErrorModal({this.code, this.message});

  ErrorModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }
}
