import 'dart:io';

import 'package:flutter/material.dart';

import '../common/constants/assets.dart';
import '../common/constants/constants.dart';
import '../common/constants/dimensions.dart';

class IdentifyCoinImage extends StatelessWidget {
  const IdentifyCoinImage({
    super.key,
    required this.coinImage,
  });

  final File? coinImage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: Dimensions.s12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: coinImage == null
          ? Image.asset(
              Assets.identifyCoinBaseImage,
              height: Constants.identifyCoinSize,
              width: Constants.identifyCoinSize,
            )
          : ClipOval(
              child: Image.file(
                coinImage!,
                fit: BoxFit.cover,
                height: Constants.identifyCoinSize,
                width: Constants.identifyCoinSize,
              ),
            ),
    );
  }
}
