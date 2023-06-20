
import 'package:jojo_taxi/domain/model/response/base_model.dart';

class FAQResponseModal{
  ErrorModal? errorModal;
  ContentModal? contentModal;

  FAQResponseModal({this.errorModal,this.contentModal});

  FAQResponseModal.fromJson(Map<String, dynamic> json){
    errorModal = ErrorModal.fromJson(json['error']);
    contentModal = ContentModal.fromJson(json['data']);
  }

}

class ContentModal{
   List<FAQModal> content = [];

  ContentModal({ required this.content});

  ContentModal.fromJson(Map<String,dynamic> json){
    if(json['content'] != null){
      content = [];
      json['content'].forEach((v){
        content.add(FAQModal.formJson(v));
      });
    }
  }

}

class FAQModal{
  String? question;
  String? answer;

  FAQModal({this.question,this.answer});

  FAQModal.formJson(Map<String,dynamic> json){
    question = json['question'];
    answer = json['answer'];
  }
}