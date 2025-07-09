import 'package:flutter/material.dart';
import 'package:test_coin_app/common/common_theme.dart';
import 'package:test_coin_app/screen/custom_bottom_nav_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/gen/app_localizations.dart';

void main() {
  runApp(const CoinInApp());
}

class CoinInApp extends StatelessWidget {
  const CoinInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: ThemeMode.system,
      home: const CustomBottomNavScreen(),
    );
  }
}
