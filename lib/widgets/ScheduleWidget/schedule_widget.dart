import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/widgets/ScheduleWidget/schedule_headline.dart';
import 'package:schedule_app/widgets/ScheduleWidget/schedule_list.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ScheduleHeadline(appState: appState),
              ScheduleList(appState: appState)
            ],
          ),
        ));
  }
}
