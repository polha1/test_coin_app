import 'package:flutter/material.dart';
import 'package:test_coin_app/widget/settings_button.dart';
import 'package:test_coin_app/widget/user_circle.dart';

import '../common/constants/constants.dart';
import '../common/constants/dimensions.dart';

class CoinInAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoinInAppBar({
    super.key,
    required this.onSettingsTap,
    required this.userName,
  });

  final VoidCallback onSettingsTap;
  final String? userName;

  @override
  Widget build(BuildContext context) {
    final firstLetterOfUser = (userName?.trim().isNotEmpty ?? false)
        ? userName!.trim()[0].toUpperCase()
        : null;

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: kToolbarHeight,
        child: Stack(
          children: [
            firstLetterOfUser != null
                ? Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.s8,
                        horizontal: Dimensions.s16,
                      ),
                      child: UserCircle(firstLetter: firstLetterOfUser),
                    ),
                  )
                : SizedBox.shrink(),
            Center(
              child: Text(
                Constants.appTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.s28,
                    ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.s2,
                  horizontal: Dimensions.s16,
                ),
                child: SettingsButton(onTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
