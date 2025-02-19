import 'package:rentease/ui/screens/proprties/add_propery_screens/custom_fields/custom_field.dart';
import 'package:rentease/ui/screens/widgets/custom_text_form_field.dart';
import 'package:rentease/utils/Extensions/extensions.dart';
import 'package:rentease/utils/constant.dart';
import 'package:rentease/utils/extensions/lib/custom_text.dart';
import 'package:rentease/utils/responsiveSize.dart';
import 'package:rentease/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends CustomField {
  TextEditingController? controller;

  @override
  void init() {
    id = data['id'];
    controller = TextEditingController(text: data['value']);
    super.init();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 48.rw(context),
              height: 48.rh(context),
              decoration: BoxDecoration(
                color: context.color.tertiaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 24,
                width: 24,
                child: FittedBox(
                  child: UiUtils.imageType(
                    data['image'],
                    color: Constant.adaptThemeColorSvg
                        ? context.color.tertiaryColor
                        : null,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.rw(context),
            ),
            CustomText(
              data['name'],
              fontWeight: FontWeight.w500,
              fontSize: context.font.large,
              color: context.color.textColorDark,
            ),
            if (data['is_required'] == 1) ...[
              const SizedBox(width: 5),
              CustomText('*', color: context.color.error),
            ],
          ],
        ),
        SizedBox(
          height: 14.rh(context),
        ),
        CustomTextFormField(
          hintText: 'writeSomething'.translate(context),
          action: TextInputAction.next,
          validator: CustomTextFieldValidator.nullCheck,
          controller: controller,
          onChange: (value) {},
        ),
      ],
    );
  }

  @override
  String type = 'textbox';

  @override
  String? backValue() {
    return controller?.text;
  }
}
