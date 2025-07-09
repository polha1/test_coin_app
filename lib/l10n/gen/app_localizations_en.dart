import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get identify_button_title => 'Identify Coin';

  @override
  String get home_tab_title => 'Home';

  @override
  String get search_tab_title => 'Search';

  @override
  String get history_tab_title => 'History';

  @override
  String get collection_tab_title => 'Collection';

  @override
  String get premium_subscription_card_title => 'Free Premium Available';

  @override
  String get premium_subscription_card_subtitle => 'Tap to claim';
}
