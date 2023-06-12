import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jojo_taxi/domain/exception/exception_handler.dart';
import 'package:jojo_taxi/domain/model/login_model.dart';
import 'package:jojo_taxi/domain/model/pass_model.dart';
import 'package:jojo_taxi/domain/model/response/authentication_model.dart';
import 'package:jojo_taxi/domain/model/response/base_model.dart';
import 'package:jojo_taxi/env.dart';
import 'package:jojo_taxi/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class AuthRepository with ChangeNotifier {
  String? _token;
  AuthenticationModal? _error;
  BaseModal? _baseModal;

  Future<bool> isAuthenticated() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(Constants.prefsToken);
    if (token != null) {
      return true;
    }
    return false;
  }

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

  Future<void> login(LoginModel loginModel) async {
    Uri uri = Uri.https(Env.uri, "/authentication/login");
    return post(uri,
            headers: await getAuthHeader(),
            body: json.encode(loginModel.toJson()))
        .then((value) {
      _error = AuthenticationModal.fromJson(
          json.decode(utf8.decode(value.bodyBytes)));
      if (_error?.errormodal?.code == 0) {
        print(_error?.tokenModal?.new_access_token);
        ExceptionHandler.httpExceptionHandle(
            value.statusCode, "Successful Login");
        _saveToDevice(_error?.tokenModal?.new_access_token);
      } else {
        ExceptionHandler.httpExceptionHandle(
            401, _error?.errormodal?.message ?? "Invalid credential");
      }
      notifyListeners();
    });
  }

  void _saveToDevice(token) {
    _token = token;
    SharedPreferences.getInstance().then((pref) {
      pref.setString(Constants.prefsToken, token);
    });
  }

  Future<void> changePassword(PasswordModal passwordModal) async {
    Uri uri = Uri.https(Env.uri, "/authentication/change_password");
    print(await getAuthHeader());
    return post(uri,
            headers: await getAuthHeader(),
            body: json.encode(passwordModal.toJson()))
        .then((value) {
          print(value.body);
          _baseModal = BaseModal.fromJson(
          json.decode(utf8.decode(value.bodyBytes)));
      if (_baseModal?.errorModal?.code == 0) {
        ExceptionHandler.httpExceptionHandle(
            value.statusCode, "Successful Change Password");
      } else {
        ExceptionHandler.httpExceptionHandle(
            401, _baseModal?.errorModal?.message ?? "Failed Change Password");
      }
      notifyListeners();
    });
  }

  Future<void> logout() async {
    BaseModal baseModal;
    Uri uri = Uri.https(Env.uri, "/authentication/logout");
    return post(uri, headers: await getAuthHeader(), body: json.encode(""))
        .then((value) {
      var response = json.decode(utf8.decode(value.bodyBytes));

      baseModal = BaseModal.fromJson(
          json.decode(utf8.decode(value.bodyBytes)));
      if (baseModal?.errorModal?.code == 0) {
        _token = null;
        _removeFromDevice();
        ExceptionHandler.httpExceptionHandle(
            value.statusCode, "Successful Logout");
      } else {
        ExceptionHandler.httpExceptionHandle(
            401, _error?.errormodal?.message ?? "Failed Logout");
      }
      notifyListeners();
    });
  }

  void _removeFromDevice() {
    SharedPreferences.getInstance().then((pref) {
      pref.remove(Constants.prefsToken);
    });
  }
}
