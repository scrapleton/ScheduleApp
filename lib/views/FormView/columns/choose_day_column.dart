import 'package:flutter/material.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/utils/enums/day_of_the_week.dart';

class ChooseDayColumn extends StatelessWidget {
  const ChooseDayColumn({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Tag : "),
        const Spacer(),
        DropdownMenu(
          onSelected: (value) {
            if (value != null) {
              appState.setSelectedDay(value);
            }
          },
          inputDecorationTheme: const InputDecorationTheme(isDense: true),
          initialSelection: appState.selectedDay,
          dropdownMenuEntries: DaysOfWeek.fullWeek(DaysOfWeek.montag)
              .map<DropdownMenuEntry<DaysOfWeek>>((DaysOfWeek e) {
            return DropdownMenuEntry<DaysOfWeek>(value: e, label: e.label);
          }).toList(),
        ),
      ],
    );
  }
}
