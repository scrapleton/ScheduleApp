import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

void main() {
  group('Days of week', () {
    test('yesterday from sunday should be saturday', () {
      const today = DaysOfWeek.sunday;
      expect(DaysOfWeek.yesterday(today), DaysOfWeek.saturday);
    });

    test('yesterday from monday should be sunday', () {
      const today = DaysOfWeek.monday;
      expect(DaysOfWeek.yesterday(today), DaysOfWeek.sunday);
    });

    test('tomorrow from sunday should be monday', () {
      const today = DaysOfWeek.sunday;
      expect(DaysOfWeek.tomorrow(today), DaysOfWeek.monday);
    });

    test('tomorrow from saturday should be sunday', () {
      const today = DaysOfWeek.saturday;
      expect(DaysOfWeek.tomorrow(today), DaysOfWeek.sunday);
    });
  });
}
