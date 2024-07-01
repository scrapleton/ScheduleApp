import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

import '../data/test_data.dart';

void main() {
  group('AppState get next opening slot', () {
    final state = AppState();
    state.setSelectedShop(TestData().testedShop);

    test('before first opening, should return first slot', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 6, minute: 0));
      expect(state.getNextOpeningSlot(), TestData().fullScheduleFromMonday[0]);
    });

    test('during first opening, should return second slot', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 8, minute: 45));
      expect(state.getNextOpeningSlot(), TestData().fullScheduleFromMonday[1]);
    });

    test('after first opening, should return second slot', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 13, minute: 30));
      expect(state.getNextOpeningSlot(), TestData().fullScheduleFromMonday[1]);
    });

    test('during second opening, should return third slot', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 14, minute: 30));
      expect(state.getNextOpeningSlot(), TestData().fullScheduleFromMonday[2]);
    });

    test('after the last slot, should return the first solt', () {
      state.setSelectedDay(DaysOfWeek.sunday);
      state.setSelectedTime(const TimeOfDay(hour: 14, minute: 30));
      expect(state.getNextOpeningSlot(), TestData().fullScheduleFromMonday[0]);
    });
  });
}
