
import 'dart:io';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';


const KEY = 'fdgfdgd';

class RatingService {

  late SharedPreferences _prefs;
  final InAppReview _innAppReview = InAppReview.instance;

  Future<bool> isSecondTimeOpen() async {

    _prefs = await SharedPreferences.getInstance();
    try {
      dynamic isSecondTime = _prefs.getBool(KEY) as bool;
      if (isSecondTime != null && !isSecondTime) {
        _prefs.setBool(KEY, false);
        return false;
      } else if (isSecondTime != null && isSecondTime) {
        _prefs.setBool(KEY, false);
        return true;
      } else {
        _prefs.setBool(KEY, true);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> showRating() async {
    String appStoreId;
    if (Platform.isIOS) {
      appStoreId = 'com.appsite.DietList';
    } else {
      appStoreId = 'com.drobotuhina.DietList';
    }


    try {

      final available = await _innAppReview.isAvailable();
      if (available) {
        _innAppReview.requestReview();
      } else {
        _innAppReview.openStoreListing(
            appStoreId: appStoreId
        );
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


}