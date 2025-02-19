import 'dart:io';

import 'package:rentease/utils/AppIcon.dart';
import 'package:rentease/utils/Extensions/extensions.dart';
import 'package:rentease/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class PanaromaImageScreen extends StatelessWidget {
  const PanaromaImageScreen({
    required this.imageUrl,
    super.key,
    this.isFileImage,
  });
  final String imageUrl;
  final bool? isFileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 8),
          decoration: BoxDecoration(
            color: context.color.secondaryColor,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: UiUtils.getSvg(
              AppIcons.arrowLeft,
              matchTextDirection: true,
              fit: BoxFit.none,
              color: context.color.tertiaryColor,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Panorama(
        sensitivity: 2,
        latitude: 4,
        child: (isFileImage ?? false)
            ? Image.file(File(imageUrl))
            : Image.network(
                imageUrl,
              ),
      ),
    );
  }
}
