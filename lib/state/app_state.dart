import 'package:flutter/material.dart';
import 'package:schedule_app/data/shops_data.dart';
import 'package:schedule_app/models/shop.dart';
import 'package:schedule_app/models/time_slot.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';
import 'package:schedule_app/utils/extensions/int_extension.dart';
import 'package:schedule_app/utils/extensions/time_of_day_extension.dart';

class AppState extends ChangeNotifier {
  late TimeOfDay _selectedTime;
  late DaysOfWeek _selectedDay;
  late List<Shop> allShops;
  late Shop _selectedShop;
  late List<DaysOfWeek> _myWeek;

  TimeOfDay get selectedTime => _selectedTime;
  DaysOfWeek get selectedDay => _selectedDay;
  Shop get selectedShop => _selectedShop;
  List<DaysOfWeek> get myWeek => _myWeek;

  AppState() {
    _selectedTime = TimeOfDay.now();

    _selectedDay = DaysOfWeek.monday;
    _myWeek = DaysOfWeek.fullWeek(_selectedDay);
    allShops = ShopsData().allShops;
    _selectedShop = allShops[0];
    notifyListeners();
  }

  setSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }

  setSelectedDay(DaysOfWeek day) {
    _selectedDay = day;
    _myWeek = DaysOfWeek.fullWeek(_selectedDay);
    notifyListeners();
  }

  setSelectedShop(Shop shop) {
    _selectedShop = shop;
    notifyListeners();
  }

  //Check is the shop is open now.
  bool isOpenNow() {
    if (getCurrentSlot() != null) {
      return true;
    } else {
      return false;
    }
  }

//Check if the shop is open between today and tomorrow
  bool staysOpenUntilNextDay(TimeSlot slot) {
    var nextSlot = getNextFromSlot(slot);
    return (slot.end == 1440 &&
        nextSlot.day == DaysOfWeek.tomorrow(slot.day) &&
        nextSlot.start == 0);
  }

//Check if the shop was open between yesterday and today
  bool wasAlreadyOpen(TimeSlot slot) {
    var previousSlot = getPreviousFromSlot(slot);
    return (slot.start == 0 &&
        previousSlot.day == DaysOfWeek.yesterday(slot.day) &&
        previousSlot.end == 1440);
  }

  //If the shop is open now, return the current Slot
  //Else return nil
  TimeSlot? getCurrentSlot() {
    for (final slot in _selectedShop.schedule) {
      if (_selectedDay == slot.day) {
        //Check the time
        if (_selectedTime.intValue() >= slot.start &&
            _selectedTime.intValue() < slot.end) {
          return slot;
        }
      }
    }
    return null;
  }

//Return the schedule of a given day ordered
  List<TimeSlot> getFullDay(DaysOfWeek daysOfWeek) {
    //Get all opening slots for the giving day
    final dailyOpeningTimeSlots = _selectedShop.schedule
        .where((openingTimeSlot) => openingTimeSlot.day == daysOfWeek)
        .toList();

    //Sort the slots based on the startTime
    dailyOpeningTimeSlots.sort((a, b) => a.start.compareTo(b.start));
    return dailyOpeningTimeSlots;
  }

//Return the schedule of the week ordered starting with the selected day
  List<TimeSlot> getFullWeek() {
    List<TimeSlot> fullSchedule = [];

    for (final day in myWeek) {
      fullSchedule.addAll(getFullDay(day));
    }
    return fullSchedule;
  }

//Return the schedule of the week ordered starting with the selected day AND time
  List<TimeSlot> getFullWeekStartingAt() {
    var fullSchedule = getFullWeek();

    //Put the passed timeSlots at the end of the list
    var numberOfSlotsToPush = 0;
    for (final slot in fullSchedule) {
      //if is past
      if (slot.day == _selectedDay && slot.start < _selectedTime.intValue()) {
        numberOfSlotsToPush = numberOfSlotsToPush + 1;
      } else {
        break;
      }
    }

    if (numberOfSlotsToPush > 0) {
      var pushedSlot = fullSchedule.getRange(0, numberOfSlotsToPush + 1);
      fullSchedule.removeRange(0, numberOfSlotsToPush);
      fullSchedule.addAll(pushedSlot);
    }

    return fullSchedule;
  }

  TimeSlot getNextOpeningSlot() {
    return getFullWeekStartingAt()[0];
  }

  TimeSlot getNextFromSlot(TimeSlot slot) {
    final fullWeek = getFullWeek();
    var index = fullWeek.indexWhere((e) => e == slot);

    if (index == fullWeek.length - 1) {
      return fullWeek[0];
    } else {
      return fullWeek[index + 1];
    }
  }

  TimeSlot getPreviousFromSlot(TimeSlot slot) {
    final fullWeek = getFullWeek();
    var index = fullWeek.indexWhere((e) => e == slot);

    if (index == 0) {
      return fullWeek[fullWeek.length - 1];
    } else {
      return fullWeek[index - 1];
    }
  }

  //Retrun a list to describe the schedule of the day
  List<String> getDailyScheduleDescriptions(DaysOfWeek daysOfWeek) {
    final openingTimeSlot = getFullDay(daysOfWeek);
    if (openingTimeSlot.isEmpty) {
      return ['Geschlossen'];
    }

    List<String> response = [];
    for (final timeSlot in openingTimeSlot) {
      var description = getDescription(timeSlot);
      if (description != null) {
        response.add(description);
      }
    }
    if (response.isEmpty) {
      response.add("Geschlossen");
    }
    return response;
  }

  String getOpeningTimeForGivenDay(DaysOfWeek givenDay) {
    var result = getDailyScheduleDescriptions(givenDay);
    var text = '';
    for (var t in result) {
      text = "$text$t\n ";
    }
    if (text.isNotEmpty) {
      return text.substring(0, text.length - 2);
    } else {
      return text;
    }
  }

  String? getDescription(TimeSlot slot) {
    //Open all day case
    if (slot.start == 0 && slot.end == 1440) {
      return 'Ganztags geöfnet';

      //Stay open case
    } else if (staysOpenUntilNextDay(slot)) {
      var nextSlot = getNextFromSlot(slot);
      String opening = slot.start.toTimeString();
      String closing = nextSlot.end.toTimeString();
      return '$opening - $closing';
      //Was already open
    } else if (wasAlreadyOpen(slot)) {
      return null;
      //Normal case
    } else {
      String opening = slot.start.toTimeString();
      String closing = slot.end.toTimeString();

      return '$opening - $closing';
    }
  }

  String getNextStatus() {
    var currentSlot = getCurrentSlot();

    //Open case
    if (currentSlot != null) {
      //if it stays open untill tomorrow
      if (staysOpenUntilNextDay(currentSlot)) {
        final nextSlot = getNextFromSlot(currentSlot);
        if (1440 - _selectedTime.intValue() + nextSlot.end < 60) {
          return "schließt um ${nextSlot.end.toTimeString()}";
        } else {
          return "";
        }
      }
      //if it closes today
      else if (currentSlot.end - _selectedTime.intValue() <= 60) {
        return "schließt um ${currentSlot.end.toTimeString()}";
      }
      //Close case
    } else {
      var todaysSlots = getFullDay(_selectedDay);
      for (final slot in todaysSlots) {
        if (slot.start - _selectedTime.intValue() > 0 &&
            slot.start - _selectedTime.intValue() <= 60) {
          //Next opening in less than 1 hour
          return "öffnet um ${slot.start.toTimeString()}";
        }
      }
      var nextOpening = getNextOpeningSlot();
      if (nextOpening.day != _selectedDay) {
        //Next opening another day
        return "öffnet ${nextOpening.day.label} um ${nextOpening.start.toTimeString()}";
      }
    }
    return "";
  }
}
