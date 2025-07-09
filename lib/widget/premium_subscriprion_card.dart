import 'package:flutter/material.dart';
import 'package:test_coin_app/widget/bracketed_coin_image.dart';

import '../common/app_gradients.dart';
import '../common/constants/dimensions.dart';
import '../l10n/gen/app_localizations.dart';

class PremiumSubscriptionCard extends StatelessWidget {
  const PremiumSubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.s16,
      ),
      child: Container(
          width: double.infinity,
          height: Dimensions.s70,
          decoration: BoxDecoration(
            gradient: theme.extension<AppGradients>()!.premiumCardBackground,
            borderRadius: BorderRadius.circular(Dimensions.s12),
          ),
          child: Row(
            children: [
              const SizedBox(width: Dimensions.s12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.s12),
                child: Center(child: BracketedCoinImage()),
              ),
              const SizedBox(width: Dimensions.s12),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.premium_subscription_card_title,
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: Dimensions.s2,
                  ),
                  Text(
                    l10n.premium_subscription_card_subtitle,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
