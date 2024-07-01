import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

import '../data/test_data.dart';

void main() {
  group('AppState get next status', () {
    final state = AppState();
    state.setSelectedShop(TestData().testedShop);

    test('when close in 1 hour or less, should specify it', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 12, minute: 00));
      expect(state.getNextStatus(), 'schließt um 13:00');
    });

    test('when close in more than 1 hour, should not specify it', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 11, minute: 59));
      expect(state.getNextStatus(), '');
    });

    test('when open in 1 hour or less, should specify it', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 7, minute: 30));
      expect(state.getNextStatus(), 'öffnet um 8:30');
    });

    test('when open in more than 1 hour, should not specify it', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 5, minute: 30));
      expect(state.getNextStatus(), '');
    });

    test('when next opening is in the next days, should  specify it', () {
      state.setSelectedDay(DaysOfWeek.saturday);
      state.setSelectedTime(const TimeOfDay(hour: 5, minute: 30));
      expect(state.getNextStatus(), 'öffnet Montag um 8:30');
    });

    test('when next opening is in the next days, should  specify it', () {
      state.setSelectedDay(DaysOfWeek.saturday);
      state.setSelectedTime(const TimeOfDay(hour: 5, minute: 30));
      expect(state.getNextStatus(), 'öffnet Montag um 8:30');
    });

    test(
        'when close in less than 1 hour, but stay open until next day, should not specify it',
        () {
      state.setSelectedDay(DaysOfWeek.wednesday);
      state.setSelectedTime(const TimeOfDay(hour: 23, minute: 30));
      expect(state.getNextStatus(), '');
    });

    test(
        'when but stay open until next day but close in less than an hour, shoud specify it',
        () {
      state.setSelectedDay(DaysOfWeek.thursday);
      state.setSelectedTime(const TimeOfDay(hour: 23, minute: 30));
      expect(state.getNextStatus(), 'schließt um 00:15');
    });
  });
}
