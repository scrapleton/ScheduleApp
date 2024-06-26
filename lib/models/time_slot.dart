import 'package:schedule_app/utils/enums/day_of_the_week.dart';

class TimeSlot {
  DaysOfWeek day;
  int start;
  int end;

  TimeSlot(
      {required this.day,
      required this.start,
      required this.end});

  bool isOpenNow(DaysOfWeek currentDay, int currentTime) {
    //Check the day
    if (currentDay == day) {
      //Check the time
      if (currentTime >= start && currentTime < end) {
        return true;
      }
    }
    return false;
  }
}
