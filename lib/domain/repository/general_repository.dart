import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:jojo_taxi/domain/exception/exception_handler.dart';
import 'package:jojo_taxi/domain/model/response/about_response_model.dart';
import 'package:jojo_taxi/domain/model/response/faq_response_modal.dart';
import 'package:jojo_taxi/env.dart';
import 'package:jojo_taxi/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralRepository with ChangeNotifier {
  Map<String, String> _createAuthHeader(String token) {
    return {
      'Content-Type': "application/json",
      'module': 'driver',
      'platform': 'android',
      'client-version': '1.1.10',
      'language': 'en',
      'device-id': 'dev1234567890',
      'operating-system-version': 'lollipop 14.3.2',
      'secure-key': 'EpdM82lwqxphrAFo',
      'access-token': token
    };
  }

  Future<Map<String, String>> getAuthHeader() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(Constants.prefsToken);
    return _createAuthHeader(token ?? '');
  }

  Future<String?> fetchAbout() async {
    AboutResponseModel aboutResponseModel;
    Uri uri = Uri.https(Env.uri, "/general/get_about");
    final response = await get(uri, headers: await getAuthHeader());
    final extractedData = json.decode(utf8.decode(response.bodyBytes));
    aboutResponseModel = AboutResponseModel.fromJson(extractedData);
    if (aboutResponseModel.errorModal?.code == 0) {
      return aboutResponseModel.aboutModal?.about_html;
    } else {
      ExceptionHandler.httpExceptionHandle(
          401, aboutResponseModel?.errorModal?.message ?? "Please Try Again");
    }
    notifyListeners();
  }

  Future<List<FAQModal>?> fetchFaq() async {
    FAQResponseModal faqResponseModal;
    Uri uri = Uri.https(Env.uri, "/general/get_faq");
    final response = await get(uri, headers: await getAuthHeader());
    final extractedData = json.decode(utf8.decode(response.bodyBytes));

    print(extractedData);
    faqResponseModal = FAQResponseModal.fromJson(extractedData);
    if (faqResponseModal.errorModal?.code == 0) {

      return faqResponseModal.contentModal?.content;
    } else {
      ExceptionHandler.httpExceptionHandle(
          401, faqResponseModal?.errorModal?.message ?? "Please Try Again");
    }
    notifyListeners();
  }
}
