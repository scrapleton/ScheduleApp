import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {

  //Convert a TimeOfDay into an int = total number of minutes
  int intValue() {
    return (hour * 60) + minute;
  }
}
