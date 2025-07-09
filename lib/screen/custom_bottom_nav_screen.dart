import 'package:flutter/material.dart';
import 'package:test_coin_app/common/constants/dimensions.dart';
import 'package:test_coin_app/l10n/gen/app_localizations.dart';
import 'package:test_coin_app/widget/home_widget.dart';

import '../common/app_gradients.dart';

enum CustomNavItems {
  home,
  search,
  history,
  collection;

  String getLabel(AppLocalizations l10n) {
    return switch (this) {
      home => l10n.home_tab_title,
      search => l10n.search_tab_title,
      history => l10n.history_tab_title,
      collection => l10n.collection_tab_title,
    };
  }

  IconData get icon {
    return switch (this) {
      home => Icons.home_outlined,
      search => Icons.search,
      history => Icons.history,
      collection => Icons.grid_view_rounded,
    };
  }
}

class CustomBottomNavScreen extends StatefulWidget {
  const CustomBottomNavScreen({super.key});

  @override
  State<CustomBottomNavScreen> createState() => _CustomBottomNavScreenState();
}

class _CustomBottomNavScreenState extends State<CustomBottomNavScreen> {
  CustomNavItems _selectedItem = CustomNavItems.home;

  void _onTabTapped(CustomNavItems item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: theme.extension<AppGradients>()!.scaffoldBackground,
        ),
        child: HomeWidget(),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: Dimensions.s70,
            height: Dimensions.s70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColor.withValues(alpha: Dimensions.p40),
            ),
          ),
          SizedBox(
            height: Dimensions.s60,
            width: Dimensions.s60,
            child: FloatingActionButton(
              onPressed: () {
                // Action
              },
              backgroundColor: theme.primaryColor,
              elevation: Dimensions.s0,
              shape: const CircleBorder(),
              child: const Icon(Icons.camera_alt, color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _BottomBar(
        selectedItem: _selectedItem,
        onTabSelected: (index) => _onTabTapped(CustomNavItems.values[index]),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final CustomNavItems selectedItem;
  final ValueChanged<int> onTabSelected;

  const _BottomBar({
    required this.selectedItem,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000), // = #00000029
            offset: Offset(0, 24),
            blurRadius: 80,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        child: BottomAppBar(
          color: theme.bottomNavigationBarTheme.backgroundColor,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: Dimensions.s50,
            child: Row(
              children: [
                for (var i = 0; i < CustomNavItems.values.length; i++) ...[
                  if (i == CustomNavItems.values.length ~/ 2)
                    SizedBox(width: Dimensions.s60),
                  Expanded(
                    child: _NavItem(
                      icon: CustomNavItems.values[i].icon,
                      label: CustomNavItems.values[i].getLabel(l10n),
                      selected: selectedItem == CustomNavItems.values[i],
                      onTap: () => onTabSelected(i),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColor = theme.bottomNavigationBarTheme.selectedItemColor;
    final inactiveColor = theme.bottomNavigationBarTheme.unselectedItemColor;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: Dimensions.s24,
              color: selected ? activeColor : inactiveColor),
          const SizedBox(height: Dimensions.s4),
          Text(label,
              style: theme.textTheme.labelMedium
                  ?.copyWith(color: selected ? activeColor : inactiveColor)),
        ],
      ),
    );
  }
}
