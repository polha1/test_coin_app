import 'package:flutter/material.dart';
import 'package:test_coin_app/widget/coin_app_bar.dart';
import 'package:test_coin_app/widget/identify_coin_widget.dart';
import 'package:test_coin_app/widget/premium_subscriprion_card.dart';

import '../common/constants/dimensions.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CoinInAppBar(
              onSettingsTap: () {},
              userName: 'Natalia',
            ),
            const SizedBox(height: Dimensions.s24),
            PremiumSubscriptionCard(),
            const SizedBox(height: Dimensions.s66),
            IdentifyCoinWidget()
          ],
        ),
      ),
    );
  }
}
