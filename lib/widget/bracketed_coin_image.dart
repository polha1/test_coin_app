import 'package:flutter/material.dart';

import '../common/constants/assets.dart';
import '../common/constants/constants.dart';
import '../common/constants/dimensions.dart';

class BracketedCoinImage extends StatelessWidget {
  final double size;
  final double bracketSize;
  final String bracketAsset;
  final Widget? image;

  const BracketedCoinImage({
    super.key,
    this.size = Dimensions.s36,
    this.bracketSize = 10.5,
    this.bracketAsset = Assets.cornerRectangleImage,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final brackets = [
      _BracketPosition(angle: 180, top: 0, left: 0),
      _BracketPosition(angle: 270, top: 0, right: 0),
      _BracketPosition(angle: 90, bottom: 0, left: 0),
      _BracketPosition(angle: 0, bottom: 0, right: 0),
    ];
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.s4),
            child: image ??
                Image.asset(
                  Assets.smallCoinImage,
                  width: size,
                  height: size,
                ),
          ),
          ...brackets.map((b) => Positioned(
                top: b.top,
                bottom: b.bottom,
                left: b.left,
                right: b.right,
                child: _buildBracket(b.angle),
              )),
        ],
      ),
    );
  }

  Widget _buildBracket(double angleDegrees) {
    return Transform.rotate(
      angle: angleDegrees * Constants.degToRad,
      child: Image.asset(
        bracketAsset,
        width: bracketSize,
        height: bracketSize,
      ),
    );
  }
}

class _BracketPosition {
  final double angle;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const _BracketPosition({
    required this.angle,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
}
