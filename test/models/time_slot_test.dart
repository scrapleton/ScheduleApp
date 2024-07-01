import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_app/models/time_slot.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

void main() {
  group('Time slots equality', () {
    final source = TimeSlot(day: DaysOfWeek.monday, start: 0, end: 100);
    test('Two same timeslots should be equals', () {
      final comparable = TimeSlot(day: DaysOfWeek.monday, start: 0, end: 100);

      expect(source == comparable, true);
    });

    test('Two same timeslots with diferents days should not be equals', () {
      final comparable = TimeSlot(day: DaysOfWeek.thursday, start: 0, end: 100);

      expect(source == comparable, false);
    });

    test('Two same timeslots with diferents start should not be equals', () {
      final comparable = TimeSlot(day: DaysOfWeek.monday, start: 50, end: 100);

      expect(source == comparable, false);
    });

    test('Two same timeslots with diferents end should not be equals', () {
      final comparable = TimeSlot(day: DaysOfWeek.monday, start: 0, end: 150);

      expect(source == comparable, false);
    });
  });
}
