import 'package:rentease/utils/Extensions/extensions.dart';
import 'package:rentease/utils/extensions/lib/custom_text.dart';
import 'package:rentease/utils/ui_utils.dart';
import 'package:flutter/material.dart';

enum PromoteCardType { text, icon }

class PromotedCard extends StatelessWidget {
  const PromotedCard({required this.type, super.key, this.color});
  final PromoteCardType type;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (type == PromoteCardType.icon) {
      return Container(
        // width: 64,
        // height: 24,
        decoration: BoxDecoration(
          color: color ?? context.color.tertiaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Center(
            child: CustomText(
              UiUtils.translate(context, 'featured'),
              fontWeight: FontWeight.bold,
              color: context.color.primaryColor,
              fontSize: context.font.smaller,
            ),
          ),
        ),
      );
    }

    return Container(
      width: 64,
      height: 24,
      decoration: BoxDecoration(
        color: context.color.tertiaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: CustomText(
          UiUtils.translate(context, 'featured'),
          fontWeight: FontWeight.bold,
          color: context.color.primaryColor,
          fontSize: context.font.smaller,
        ),
      ),
    );
  }
}
