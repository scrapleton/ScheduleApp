import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

import '../data/test_data.dart';

void main() {
  group('AppState initial values', () {
    final state = AppState();

    test('selected day should be monday', () {
      expect(state.selectedDay, DaysOfWeek.monday);
    });
    test('my week should start on monday', () {
      expect(state.myWeek, TestData().expectedWeekFromMonday);
    });

    test('selected time should be now', () {
      final now = TimeOfDay.now();
      expect(state.selectedTime, now);
    });

    test('selected shop should be the first of the list', () {
      expect(state.selectedShop, state.allShops[0]);
    });

    group('AppState isOpenNow', () {
      final state = AppState();
      state.setSelectedDay(DaysOfWeek.monday);
      test('before first opening of the day, should be close', () {
        state.setSelectedTime(const TimeOfDay(hour: 6, minute: 0));
        expect(state.isOpenNow(), false);
      });
      test('one minute before first opening of the day, should be close', () {
        state.setSelectedTime(const TimeOfDay(hour: 8, minute: 29));
        expect(state.isOpenNow(), false);
      });

      test('at first opening time the day, should be open', () {
        state.setSelectedTime(const TimeOfDay(hour: 8, minute: 30));
        expect(state.isOpenNow(), true);
      });

      test('one minute before closing, should be open', () {
        state.setSelectedTime(const TimeOfDay(hour: 12, minute: 59));
        expect(state.isOpenNow(), true);
      });

      test('at closing time, should be close', () {
        state.setSelectedTime(const TimeOfDay(hour: 13, minute: 0));
        expect(state.isOpenNow(), false);
      });
    });
  });
}
