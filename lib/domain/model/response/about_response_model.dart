
import 'package:jojo_taxi/domain/model/response/base_model.dart';

class AboutResponseModel{
  ErrorModal? errorModal;
  AboutModal? aboutModal;

  AboutResponseModel({this.errorModal,this.aboutModal});

  AboutResponseModel.fromJson(Map<String, dynamic> json) {
    errorModal = ErrorModal.fromJson(json['error']);
    aboutModal = AboutModal.fromJson(json['data']);
  }

}

class AboutModal{
  String? about_html;

  AboutModal({this.about_html});

  AboutModal.fromJson(Map<String, dynamic> json) {
    about_html = json['about_html'];
  }
}
