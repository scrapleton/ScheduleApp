import 'package:flutter/material.dart';
import 'package:schedule_app/models/shop.dart';
import 'package:schedule_app/state/app_state.dart';

class ChooseShopColumn extends StatelessWidget {
  const ChooseShopColumn({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Ort : "),
        const Spacer(),
        DropdownMenu(
          onSelected: (value) {
            if (value != null) {
              appState.setSelectedShop(value);
            }
          },
          initialSelection: appState.selectedShop,
          inputDecorationTheme: const InputDecorationTheme(isDense: true),
          dropdownMenuEntries:
              appState.allShops.map<DropdownMenuEntry<Shop>>((Shop e) {
            return DropdownMenuEntry<Shop>(value: e, label: e.name);
          }).toList(),
        ),
      ],
    );
  }
}
