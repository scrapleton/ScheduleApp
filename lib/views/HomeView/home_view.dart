import 'package:flutter/material.dart';
import 'package:schedule_app/views/FormView/form_view.dart';
import 'package:schedule_app/widgets/ScheduleWidget/schedule_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          FormView(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ScheduleWidget(),
          )
        ],
      )),
    );
  }
}
