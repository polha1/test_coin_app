import 'package:flutter/material.dart';

import '../common/constants/dimensions.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback onTap;

  const SettingsButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Dimensions.s40,
        height: Dimensions.s40,
        decoration: BoxDecoration(
          color: theme.primaryColor.withValues(alpha: Dimensions.p10),
          borderRadius: BorderRadius.circular(Dimensions.s8),
        ),
        child: Icon(
          Icons.settings,
          color: theme.primaryColor,
          size: Dimensions.s20,
        ),
      ),
    );
  }
}
