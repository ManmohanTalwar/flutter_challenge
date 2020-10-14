import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/components/Toast.dart';
import 'package:flutter_challenge/utils/app_constants.dart';
import 'package:intl/intl.dart';

class Helper {
  static showToast({BuildContext context, String text}) {
    return Toast(
            textColor: AppConstants.white,
            bgColor: AppConstants.black,
            textFontSize: 16.0,
            text: text)
        .showDialog(context);
  }

  static showErrorToast({BuildContext context, String text}) {
    return Toast(
            textColor: AppConstants.white,
            bgColor: AppConstants.red,
            textFontSize: 16.0,
            text: text)
        .showDialog(context);
  }

  static showInfoToast({BuildContext context, String text}) {
    return Toast(
            textColor: AppConstants.white,
            bgColor: AppConstants.grey.withOpacity(0.5),
            textFontSize: 16.0,
            text: text)
        .showDialog(context);
  }

  static String getTimeWithAmPm(String time, String dateTime) {
    return '${int.parse(time.split(':')[0]) > 13 ? int.parse(time.split(':')[0]) - 12 : int.parse(time.split(':')[0])}:${time.split(':')[1]} ${TimeOfDay.fromDateTime(DateTime.parse(dateTime)).periodOffset == 0 ? 'am' : 'pm'}';
  }

  static String stringForDatetime(String dt) {
    var dtInLocal = DateTime.parse(dt);
//    .add(Duration(
//      hours: 5,
//      minutes: 30,
//    ));
    //DateTime.fromMillisecondsSinceEpoch( 1490489845  * 1000).toLocal(); //year:  1490489845 //>day: 1556152819  //month:  1553561845  //<day: 1556174419
    var now = DateTime.now().toLocal();
    var dateString = " ";

    var diff = now.difference(dtInLocal);

    if (now.day == dtInLocal.day) {
      // creates format like: 12:35 PM,
      var todayFormat = DateFormat("h:mm a");
      dateString += todayFormat.format(dtInLocal);
    } else if ((diff.inDays) == 1 ||
        (diff.inSeconds < 86400 && now.day != dtInLocal.day)) {
      var yesterdayFormat = DateFormat("MMM d, h:mm a");
//      dateString += "Yesterday, " + yesterdayFormat.format(dtInLocal);
      dateString += yesterdayFormat.format(dtInLocal);
    } else if (now.year == dtInLocal.year && diff.inDays > 30) {
      var monthFormat = DateFormat("MMM d, h:mm a");
      dateString += monthFormat.format(dtInLocal);
    } else {
      var yearFormat = DateFormat("MMM d y");
      dateString += yearFormat.format(dtInLocal);
    }

    return dateString;
  }

  static String stringForDatetimeDT(DateTime dt) {
    var dtInLocal = dt.toLocal();
    //DateTime.fromMillisecondsSinceEpoch( 1490489845  * 1000).toLocal(); //year:  1490489845 //>day: 1556152819  //month:  1553561845  //<day: 1556174419
    var now = DateTime.now().toLocal();
    var dateString = "Edited ";

    var diff = now.difference(dtInLocal);

    if (now.day == dtInLocal.day) {
      // creates format like: 12:35 PM,
      var todayFormat = DateFormat("h:mm a");
      dateString += todayFormat.format(dtInLocal);
    } else if ((diff.inDays) == 1 ||
        (diff.inSeconds < 86400 && now.day != dtInLocal.day)) {
      var yesterdayFormat = DateFormat("h:mm a");
      dateString += "Yesterday, " + yesterdayFormat.format(dtInLocal);
    } else if (now.year == dtInLocal.year && diff.inDays > 1) {
      var monthFormat = DateFormat("MMM d");
      dateString += monthFormat.format(dtInLocal);
    } else {
      var yearFormat = DateFormat("MMM d y");
      dateString += yearFormat.format(dtInLocal);
    }

    return dateString;
  }

  static String stringFormDatetimeDT(DateTime dt) {
    var dtInLocal = dt.toLocal();
    var dateString = "";

    var yearFormat = DateFormat("y-MM-d");
    dateString += yearFormat.format(dtInLocal);

    return dateString;
  }
}
