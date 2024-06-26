import 'package:flutter/material.dart';
import 'package:schedule_app/state/app_state.dart';

class ScheduleHeadline extends StatelessWidget {
  const ScheduleHeadline({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.access_time),
      ),
      const Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            appState.isOpenNow() ? "Offen" : "Geschlossen",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            appState.getNextStatus(),
          ),
        ],
      ),
    ]);
  }
}
