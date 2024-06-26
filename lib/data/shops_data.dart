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
  TimeSlot(day: DaysOfWeek.montag, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.montag, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.dienstag, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.dienstag, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.freitag, start: 510, end: 780),
  TimeSlot(day: DaysOfWeek.freitag, start: 840, end: 1050),
]);

final Shop disco = Shop(name: "Disco", schedule: [
  TimeSlot(day: DaysOfWeek.montag, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.dienstag, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.dienstag, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.freitag, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.freitag, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.samstag, start: 0, end: 180),
  TimeSlot(day: DaysOfWeek.samstag, start: 1200, end: 1440),
  TimeSlot(day: DaysOfWeek.sonntag, start: 0, end: 180),
]);

final Shop friseur = Shop(name: "Friseur", schedule: [
  TimeSlot(day: DaysOfWeek.dienstag, start: 450, end: 1110),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 450, end: 1110),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 450, end: 1110),
  TimeSlot(day: DaysOfWeek.freitag, start: 450, end: 1110),
  TimeSlot(day: DaysOfWeek.samstag, start: 840, end: 1050),
  TimeSlot(day: DaysOfWeek.sonntag, start: 840, end: 1050),
]);

final Shop spielplatz = Shop(name: "Spielplatz", schedule: [
  TimeSlot(day: DaysOfWeek.montag, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.dienstag, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.freitag, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.samstag, start: 480, end: 1080),
  TimeSlot(day: DaysOfWeek.sonntag, start: 480, end: 1080),
]);

final Shop cafe = Shop(name: "Café", schedule: [
  TimeSlot(day: DaysOfWeek.dienstag, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.dienstag, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.freitag, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.freitag, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.samstag, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.samstag, start: 750, end: 1080),
  TimeSlot(day: DaysOfWeek.sonntag, start: 540, end: 690),
  TimeSlot(day: DaysOfWeek.sonntag, start: 750, end: 1080),
]);

final Shop bar = Shop(name: "Bar", schedule: [
  TimeSlot(day: DaysOfWeek.montag, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.dienstag, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.freitag, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.samstag, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.sonntag, start: 480, end: 720),
  TimeSlot(day: DaysOfWeek.montag, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.dienstag, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.freitag, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.samstag, start: 1080, end: 1440),
  TimeSlot(day: DaysOfWeek.dienstag, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.mittwoch, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.donnerstag, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.freitag, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.samstag, start: 0, end: 60),
  TimeSlot(day: DaysOfWeek.sonntag, start: 0, end: 180),
]);
