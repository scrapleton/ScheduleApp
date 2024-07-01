import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

import '../data/test_data.dart';

void main() {
  group('get Daily description', () {
    final state = AppState();
    state.setSelectedShop(TestData().testedShop);
    test('monday should be : "8:30 - 13:00", "14:00 - 17:30" ', () {
      expect(state.getDailyScheduleDescriptions(DaysOfWeek.monday),
          ["8:30 - 13:00", "14:00 - 17:30"]);
      expect(state.getOpeningTimeForGivenDay(DaysOfWeek.monday),
          "8:30 - 13:00\n 14:00 - 17:30");
    });

    test('tuesday should be : Ganztags geöfnet', () {
      expect(state.getDailyScheduleDescriptions(DaysOfWeek.tuesday),
          ["Ganztags geöfnet"]);
      expect(state.getOpeningTimeForGivenDay(DaysOfWeek.tuesday),
          "Ganztags geöfnet");
    });
    test('wednesday should be : 21:00 - 3:00', () {
      expect(state.getDailyScheduleDescriptions(DaysOfWeek.wednesday),
          ['21:00 - 3:00']);
      expect(state.getOpeningTimeForGivenDay(DaysOfWeek.wednesday),
          "21:00 - 3:00");
    });
    test('thursday should be :  12:00 - 00:15', () {
      expect(state.getDailyScheduleDescriptions(DaysOfWeek.thursday),
          ['12:00 - 00:15']);
      expect(state.getOpeningTimeForGivenDay(DaysOfWeek.thursday),
          "12:00 - 00:15");
    });
    test('friday should be : Geschlossen ', () {
      expect(state.getDailyScheduleDescriptions(DaysOfWeek.friday),
          ['Geschlossen']);
      expect(state.getOpeningTimeForGivenDay(DaysOfWeek.friday), "Geschlossen");
    });
    test('saturday should be  Geschlossen', () {
      expect(state.getDailyScheduleDescriptions(DaysOfWeek.saturday),
          ['Geschlossen']);
      expect(
          state.getOpeningTimeForGivenDay(DaysOfWeek.saturday), "Geschlossen");
    });
    test('sunday should be : Geschlossen ', () {
      expect(state.getDailyScheduleDescriptions(DaysOfWeek.sunday),
          ['Geschlossen']);
      expect(state.getOpeningTimeForGivenDay(DaysOfWeek.sunday), "Geschlossen");
    });
  });
}
