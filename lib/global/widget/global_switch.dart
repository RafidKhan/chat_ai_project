import 'package:flutter/material.dart';

import '../../utils/styles/k_colors.dart';

class GlobalSwitch extends StatelessWidget {
  final bool value;
  final Function(bool value) onToggle;

  const GlobalSwitch({
    super.key,
    required this.value,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      inactiveThumbColor: KColor.greyText.color,
      inactiveTrackColor: KColor.gradient2.color,
      activeColor: KColor.white.color,
      activeTrackColor: KColor.accent.color,
      onChanged: onToggle,
    );
  }
}
