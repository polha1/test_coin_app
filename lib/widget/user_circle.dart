import 'package:flutter/material.dart';

import '../common/constants/dimensions.dart';

class UserCircle extends StatelessWidget {
  final String firstLetter;

  const UserCircle({super.key, required this.firstLetter});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: Dimensions.s40,
      height: Dimensions.s40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.primaryColor.withValues(alpha: Dimensions.p10),
      ),
      child: Center(
        child: Text(
          firstLetter,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
