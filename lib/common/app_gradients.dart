import 'package:flutter/material.dart';

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final LinearGradient premiumCardBackground;
  final LinearGradient scaffoldBackground;

  const AppGradients({
    required this.premiumCardBackground,
    required this.scaffoldBackground,
  });

  @override
  AppGradients copyWith({
    LinearGradient? premiumCardBackground,
    LinearGradient? scaffoldBackground,
  }) {
    return AppGradients(
      premiumCardBackground:
          premiumCardBackground ?? this.premiumCardBackground,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
    );
  }

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) return this;
    return AppGradients(
      premiumCardBackground: LinearGradient(
        colors: List.generate(
          premiumCardBackground.colors.length,
          (i) => Color.lerp(
            premiumCardBackground.colors[i],
            other.premiumCardBackground.colors[i],
            t,
          )!,
        ),
        begin: premiumCardBackground.begin,
        end: premiumCardBackground.end,
      ),
      scaffoldBackground: LinearGradient(
        colors: List.generate(
          scaffoldBackground.colors.length,
          (i) => Color.lerp(
            scaffoldBackground.colors[i],
            other.scaffoldBackground.colors[i],
            t,
          )!,
        ),
        begin: scaffoldBackground.begin,
        end: scaffoldBackground.end,
      ),
    );
  }
}
