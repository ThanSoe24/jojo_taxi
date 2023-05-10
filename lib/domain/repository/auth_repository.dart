
import 'package:flutter/material.dart';
import 'package:jojo_taxi/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository with ChangeNotifier {

  Future<bool> isAuthenticated() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(Constants.prefsToken);
    if (token != null ) {
      return true;
    }
    return false;
  }

}