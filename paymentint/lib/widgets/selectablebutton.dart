import 'package:flutter/material.dart';
import 'package:selectable_box/selectable_box.dart';

class SelectablePlan extends StatelessWidget {
  final String plan;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

  SelectablePlan({
    Key? key,
    required this.plan,
    required this.index,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableBox(
        height: 40,
        width: double.maxFinite,
        color: Colors.white,
        selectedColor: Colors.white,
        borderColor: Colors.grey,
        selectedBorderColor: Colors.blue,
        borderWidth: 2,
        borderRadius: 10,
        padding: const EdgeInsets.all(3),
        animationDuration: const Duration(milliseconds: 200),
        opacity: 0.5,
        selectedOpacity: 1,
        checkboxAlignment: Alignment.topRight,
        checkboxPadding: const EdgeInsets.all(0),
        selectedIcon: const Icon(
          Icons.check_circle,
          color: Colors.blue,
        ),
        unSelectedIcon: const Icon(
          Icons.check_circle_outline,
          color: Colors.grey,
        ),
        showCheckbox: isSelected,
        isSelected: isSelected,
        onTap: () => onTap(index),
        child: Center(child: Text(plan)));
  }
}
