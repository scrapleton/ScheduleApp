import 'package:schedule_app/models/shop.dart';
import 'package:schedule_app/models/time_slot.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

class ShopsData {
  static final ShopsData _singleton = ShopsData._internal();

  factory ShopsData() {
    return _singleton;
  }

  ShopsData._internal();

  final allShops = [bank, disco, friseur, spielplatz, cafe, bar];
}

final Shop bank = Shop(name: "Bank", schedule: [
  TimeSlot(day: DaysOfWeek.monday, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.monday, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.tuesday, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.tuesday, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.wednesday, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.wednesday, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.thursday, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.thursday, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.friday, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.friday, start: 840, end: 1050),
]);

final Shop disco = Shop(name: "Disco", schedule: [
  TimeSlot(day: DaysOfWeek.monday, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.tuesday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.tuesday, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.wednesday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.wednesday, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.thursday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.thursday, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.friday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.friday, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.saturday, start: 0, end: 180),
  TimeSlot(day: DaysOfWeek.saturday, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.sunday, start: 0, end: 180),
]);

final Shop friseur = Shop(name: "Friseur", schedule: [
  TimeSlot(day: DaysOfWeek.tuesday, start: 450, end: 1110),
  TimeSlot(day: DaysOfWeek.wednesday, start: 450, end: 1110),
  TimeSlot(day: DaysOfWeek.thursday, start: 450, end: 1110),
  TimeSlot(day: DaysOfWeek.friday, start: 450, end: 1110),
  TimeSlot(day: DaysOfWeek.saturday, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.sunday, start: 840, end: 1050),
]);

final Shop spielplatz = Shop(name: "Spielplatz", schedule: [
  TimeSlot(day: DaysOfWeek.monday, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.tuesday, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.wednesday, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.thursday, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.friday, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.saturday, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.sunday, start: 480, end: 1080),
]);

final Shop cafe = Shop(name: "Café", schedule: [
  TimeSlot(day: DaysOfWeek.tuesday, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.tuesday, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.wednesday, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.wednesday, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.thursday, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.thursday, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.friday, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.friday, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.saturday, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.saturday, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.sunday, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.sunday, start: 750, end: 1080),
]);

final Shop bar = Shop(name: "Bar", schedule: [
  TimeSlot(day: DaysOfWeek.monday, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.tuesday, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.wednesday, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.thursday, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.friday, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.saturday, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.sunday, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.monday, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.tuesday, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.wednesday, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.thursday, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.friday, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.saturday, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.tuesday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.wednesday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.thursday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.friday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.saturday, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.sunday, start: 0, end: 180),
]);
