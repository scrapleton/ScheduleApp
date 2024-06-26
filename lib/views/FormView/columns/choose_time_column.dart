import 'package:flutter/material.dart';
import 'package:schedule_app/state/app_state.dart';

class ChooseTimeColumn extends StatelessWidget {
  const ChooseTimeColumn({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Uhrzeit : "),
        const Spacer(),
        ElevatedButton(
            child: Text(
                "${appState.selectedTime.hour.toString()} : ${appState.selectedTime.minute.toString()}"),
            onPressed: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: appState.selectedTime,
                  initialEntryMode: TimePickerEntryMode.dial);
              if (timeOfDay != null) {
                appState.setSelectedTime(timeOfDay);
              }
            })
      ],
    );
  }
}
