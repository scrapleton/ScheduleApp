import 'package:schedule_app/models/time_slot.dart';

class Shop {
  String name;
  List<TimeSlot> schedule;

  Shop({required this.name, required this.schedule});
}
