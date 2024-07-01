import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

import '../data/test_data.dart';

void main() {
  group('AppState get full week', () {
    final state = AppState();
    state.setSelectedShop(TestData().testedShop);

    test('try from default day : monday', () {
      state.setSelectedDay(DaysOfWeek.monday);
      expect(state.getFullWeek(), TestData().fullScheduleFromMonday);
    });

    test('try from other random day : wednesay', () {
      state.setSelectedDay(DaysOfWeek.wednesday);
      expect(state.getFullWeek(), TestData().fullScheduleFromWednesday);
    });

    test('try from closed day : sunday', () {
      state.setSelectedDay(DaysOfWeek.sunday);
      expect(state.getFullWeek(), TestData().fullScheduleFromMonday);
    });
  });
}
