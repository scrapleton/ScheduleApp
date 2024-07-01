import 'package:schedule_app/models/shop.dart';
import 'package:schedule_app/models/time_slot.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

class TestData {
  final expectedWeekFromMonday = [
    DaysOfWeek.monday,
    DaysOfWeek.tuesday,
    DaysOfWeek.wednesday,
    DaysOfWeek.thursday,
    DaysOfWeek.friday,
    DaysOfWeek.saturday,
    DaysOfWeek.sunday
  ];

  final fullScheduleFromMonday = [
    //Monday open from 8:30 until 13:00 and from 14:00 from 17h30
    TimeSlot(day: DaysOfWeek.monday, start: 510, end: 780),
    TimeSlot(day: DaysOfWeek.monday, start: 840, end: 1050),
    //Tuesday open all day
    TimeSlot(day: DaysOfWeek.tuesday, start: 0, end: 1440),
    //Wednesday open from 21:00 until  thursday 03:00
    TimeSlot(day: DaysOfWeek.wednesday, start: 1260, end: 1440),
    TimeSlot(day: DaysOfWeek.thursday, start: 0, end: 180),
    //Thursday open from 12:00 to 00:15
    TimeSlot(day: DaysOfWeek.thursday, start: 720, end: 1440),
    TimeSlot(day: DaysOfWeek.friday, start: 0, end: 15)
  ];

  final fullScheduleFromWednesday = [
    TimeSlot(day: DaysOfWeek.wednesday, start: 1260, end: 1440),
    TimeSlot(day: DaysOfWeek.thursday, start: 0, end: 180),
    TimeSlot(day: DaysOfWeek.thursday, start: 720, end: 1440),
    TimeSlot(day: DaysOfWeek.friday, start: 0, end: 15),
    TimeSlot(day: DaysOfWeek.monday, start: 510, end: 780),
    TimeSlot(day: DaysOfWeek.monday, start: 840, end: 1050),
    TimeSlot(day: DaysOfWeek.tuesday, start: 0, end: 1440),
  ];

  final Shop testedShop = Shop(name: "Test", schedule: []);

  TestData() {
    testedShop.schedule = fullScheduleFromMonday;
  }
}
