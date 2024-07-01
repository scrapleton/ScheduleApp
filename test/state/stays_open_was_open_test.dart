import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

import '../data/test_data.dart';

void main() {
  group('AppState get next opening slot', () {
    final state = AppState();
    state.setSelectedShop(TestData().testedShop);

    test('when not closing at 00:00, is not staying open', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 9, minute: 0));
      var slot = state.getCurrentSlot();
      expect(state.staysOpenUntilNextDay(slot!), false);
    });

    test('when not opening at 00:00, was not open previous day', () {
      state.setSelectedDay(DaysOfWeek.wednesday);
      state.setSelectedTime(const TimeOfDay(hour: 21, minute: 30));
      var slot = state.getCurrentSlot();
      expect(state.wasAlreadyOpen(slot!), false);
    });

    test('when yesterday was not open until 00:00, was not open previous day',
        () {
      state.setSelectedDay(DaysOfWeek.tuesday);
      state.setSelectedTime(const TimeOfDay(hour: 21, minute: 30));
      var slot = state.getCurrentSlot();
      expect(state.wasAlreadyOpen(slot!), false);
    });

    test('stays open', () {
      state.setSelectedDay(DaysOfWeek.wednesday);
      state.setSelectedTime(const TimeOfDay(hour: 22, minute: 30));
      var slot = state.getCurrentSlot();
      expect(state.staysOpenUntilNextDay(slot!), true);
    });

    test('was open', () {
      state.setSelectedDay(DaysOfWeek.thursday);
      state.setSelectedTime(const TimeOfDay(hour: 0, minute: 30));
      var slot = state.getCurrentSlot();
      expect(state.wasAlreadyOpen(slot!), true);
    });
  });
}
