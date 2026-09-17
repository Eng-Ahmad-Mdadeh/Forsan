import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';

class ContactUsTextField extends StatelessWidget {
  const ContactUsTextField({
    required this.title,
    required this.hintText,
    required this.keyboardType,
    super.key,
  });

  final String title;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      title: title,
      hintText: hintText,
      height: AppHeight.h52,
      backgroundColor: AppColors.white,
      textInputType: keyboardType,
      fontSize: AppFontSize.s14,
    );
  }
}
