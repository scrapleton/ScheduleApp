import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/state/app_state.dart';
import 'package:schedule_app/views/FormView/columns/choose_day_column.dart';
import 'package:schedule_app/views/FormView/columns/choose_shop_column.dart';
import 'package:schedule_app/views/FormView/columns/choose_time_column.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        ChooseDayColumn(appState: appState),
        const SizedBox(height: 8),
        ChooseShopColumn(appState: appState),
        const SizedBox(height: 8),
        ChooseTimeColumn(appState: appState),
      ]),
    );
  }
}
