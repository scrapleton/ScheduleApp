import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/models/time_slot.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

import '../data/test_data.dart';

void main() {
  group('AppState currentSlot & isOpenNow', () {
    final state = AppState();

    state.setSelectedShop(TestData().testedShop);
    test('before first opening of the day, should be close', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 6, minute: 0));
      expect(state.getCurrentSlot(), null);
      expect(state.isOpenNow(), false);
    });
    test('one minute before first opening of the day, should be close', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 8, minute: 29));
      expect(state.getCurrentSlot(), null);
      expect(state.isOpenNow(), false);
    });

    test('at first opening time the day, should be open', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 8, minute: 30));

      expect(state.getCurrentSlot(),
          TimeSlot(day: DaysOfWeek.monday, start: 510, end: 780));
      expect(state.isOpenNow(), true);
    });

    test('one minute before closing, should be open', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 12, minute: 59));
      expect(state.getCurrentSlot(),
          TimeSlot(day: DaysOfWeek.monday, start: 510, end: 780));
      expect(state.isOpenNow(), true);
    });

    test('at closing time, should be close', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 13, minute: 0));
      expect(state.getCurrentSlot(), null);
      expect(state.isOpenNow(), false);
    });

    test('between two opening, should be close', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 13, minute: 30));
      expect(state.getCurrentSlot(), null);
      expect(state.isOpenNow(), false);
    });

    test('after last opening, should be close', () {
      state.setSelectedDay(DaysOfWeek.monday);
      state.setSelectedTime(const TimeOfDay(hour: 17, minute: 30));
      expect(state.getCurrentSlot(), null);
      expect(state.isOpenNow(), false);
    });

    test('when open all day, should be open', () {
      state.setSelectedDay(DaysOfWeek.tuesday);
      state.setSelectedTime(const TimeOfDay(hour: 17, minute: 30));
      expect(state.getCurrentSlot(),
          TimeSlot(day: DaysOfWeek.tuesday, start: 0, end: 1440));
      expect(state.isOpenNow(), true);
    });

    test('when close all day, should be close', () {
      state.setSelectedDay(DaysOfWeek.saturday);
      state.setSelectedTime(const TimeOfDay(hour: 17, minute: 30));
      expect(state.getCurrentSlot(), null);
      expect(state.isOpenNow(), false);
    });

    test('when open during night, should be open at 23:59 the first day', () {
      state.setSelectedDay(DaysOfWeek.wednesday);
      state.setSelectedTime(const TimeOfDay(hour: 23, minute: 59));
      expect(state.getCurrentSlot(),
          TimeSlot(day: DaysOfWeek.wednesday, start: 1260, end: 1440));
      expect(state.isOpenNow(), true);
    });

    test('when open during night, should be open at 00:00 the second day', () {
      state.setSelectedDay(DaysOfWeek.thursday);
      state.setSelectedTime(const TimeOfDay(hour: 0, minute: 0));
      expect(state.getCurrentSlot(),
          TimeSlot(day: DaysOfWeek.thursday, start: 0, end: 180));
      expect(state.isOpenNow(), true);
    });
  });
}
