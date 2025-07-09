import 'package:flutter/material.dart';

import 'app_gradients.dart';

class AppTheme {
  static const fontFamily = 'Poppins';

  TextStyle _baseTextStyle({
    required Color color,
    required FontWeight weight,
    required double size,
  }) {
    return TextStyle(
      fontFamily: AppTheme.fontFamily,
      color: color,
      fontWeight: weight,
      fontSize: size,
      letterSpacing: 0,
    );
  }

  ElevatedButtonThemeData _buttonTheme(Color bgColor, Color textColor) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: TextStyle(
          fontFamily: AppTheme.fontFamily,
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  AppGradients _gradients({
    required List<Color> premiumCardColors,
    required List<Color> scaffoldBackgroundColors,
  }) =>
      AppGradients(
        premiumCardBackground: LinearGradient(
          colors: premiumCardColors,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        scaffoldBackground: LinearGradient(
          colors: scaffoldBackgroundColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFEDA92D),
        cardColor: const Color(0xFFF2E9DA),
        shadowColor: const Color(0x59000000),
        unselectedWidgetColor: const Color(0xFF91A0B6),
        textTheme: TextTheme(
          titleMedium: _baseTextStyle(
            color: const Color(0xFF242424),
            weight: FontWeight.w600,
            size: 20,
          ),
          titleSmall: _baseTextStyle(
            color: const Color(0xFF242424),
            weight: FontWeight.w600,
            size: 16,
          ),
          bodyMedium: _baseTextStyle(
            color: Color(0xFF242424),
            weight: FontWeight.w400,
            size: 16.0,
          ),
          bodySmall: _baseTextStyle(
            color: Color(0xFF242424),
            weight: FontWeight.w400,
            size: 12.0,
          ),
          labelMedium: _baseTextStyle(
            color: Color(0xFF242424),
            weight: FontWeight.w500,
            size: 12.0,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF0D1C2E)),
        elevatedButtonTheme:
            _buttonTheme(const Color(0xFFFFFFFF), const Color(0xFFEDA92D)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFFFFFFFF),
          selectedItemColor: const Color(0xFFEDA92D),
          unselectedItemColor: const Color(0xFF91A0B6),
          selectedIconTheme: IconThemeData(
            color: const Color(0xFFEDA92D),
          ),
          unselectedIconTheme: IconThemeData(
            color: const Color(0xFF91A0B6),
          ),
        ),
        extensions: <ThemeExtension<dynamic>>[
          _gradients(
            premiumCardColors: [Color(0xFFFFE5B7), Color(0xFFFFD382)],
            scaffoldBackgroundColors: [Color(0xFFFFF4DF), Color(0xFFFFFFFF)],
          )
        ],
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFEDA92D),
        cardColor: const Color(0xFF2F251F),
        shadowColor: const Color(0x59000000),
        unselectedWidgetColor: const Color(0xFF9B9B9B),
        textTheme: TextTheme(
          titleMedium: _baseTextStyle(
            color: const Color(0xFFFFFFFF),
            weight: FontWeight.w600,
            size: 20,
          ),
          titleSmall: _baseTextStyle(
            color: const Color(0xFFFFFFFF),
            weight: FontWeight.w600,
            size: 16,
          ),
          bodyMedium: _baseTextStyle(
            color: Color(0xFFFFFFFF),
            weight: FontWeight.w400,
            size: 16.0,
          ),
          bodySmall: _baseTextStyle(
            color: Color(0xFFFFFFFF),
            weight: FontWeight.w400,
            size: 12.0,
          ),
          labelMedium: _baseTextStyle(
            color: Color(0xFF9B9B9B),
            weight: FontWeight.w500,
            size: 12.0,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF0D1C2E)),
        elevatedButtonTheme:
            _buttonTheme(const Color(0xFF2C2C34), const Color(0xFFEDA92D)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF2C2C34),
          selectedItemColor: const Color(0xFFEDA92D),
          unselectedItemColor: const Color(0xFF9B9B9B),
          selectedIconTheme: IconThemeData(
            color: const Color(0xFFEDA92D),
          ),
          unselectedIconTheme: IconThemeData(
            color: const Color(0xFF9B9B9B),
          ),
        ),
        extensions: <ThemeExtension<dynamic>>[
          _gradients(
            premiumCardColors: [Color(0xFF5A3A14), Color(0xFFA86C1D)],
            scaffoldBackgroundColors: [Color(0xFF1F1F27), Color(0xFF1F1F27)],
          ),
        ],
      );
}
