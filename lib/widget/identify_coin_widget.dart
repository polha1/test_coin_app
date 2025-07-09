import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_coin_app/l10n/gen/app_localizations.dart';
import 'package:test_coin_app/widget/identify_coin_image.dart';

import '../common/constants/constants.dart';
import '../common/constants/dimensions.dart';

class IdentifyCoinWidget extends StatefulWidget {
  const IdentifyCoinWidget({super.key});

  @override
  State<IdentifyCoinWidget> createState() => _IdentifyCoinWidgetState();
}

class _IdentifyCoinWidgetState extends State<IdentifyCoinWidget> {
  File? _coinImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _coinImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: Dimensions.s74),
        child: Container(
          width: double.infinity,
          height: Constants.identifyCoinCardHeight,
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.s16,
          ),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(Dimensions.s16),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: Dimensions.s24),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: _pickImage,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.s10,
                      horizontal: Dimensions.s28,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: theme.primaryColor,
                          size: Dimensions.s20,
                        ),
                        SizedBox(
                          width: Dimensions.s4,
                        ),
                        Text(
                          l10n.identify_button_title,
                          style: theme.textTheme.titleSmall
                              ?.copyWith(color: theme.primaryColor),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: IdentifyCoinImage(coinImage: _coinImage),
          )),
    ]);
  }
}
