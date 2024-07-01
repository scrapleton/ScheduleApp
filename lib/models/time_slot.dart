import 'package:schedule_app/utils/enums/day_of_the_week.dart';

class TimeSlot {
  DaysOfWeek day;
  int start;
  int end;

  TimeSlot({required this.day, required this.start, required this.end});

  @override
  bool operator ==(Object other) =>
      other is TimeSlot &&
      start == other.start &&
      end == other.end &&
      day == other.day;

  @override
  int get hashCode => Object.hash(start, end, day);
}
