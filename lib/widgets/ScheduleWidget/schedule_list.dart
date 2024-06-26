import 'package:flutter/material.dart';
import 'package:schedule_app/state/app_state.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: appState.myWeek.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appState.myWeek[index].label),
                const Spacer(),
                Text(
                  appState.getOpeningTimeForGivenDay(appState.myWeek[index]),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            const SizedBox(height: 0),
          ],
        );
      },
    );
  }
}
