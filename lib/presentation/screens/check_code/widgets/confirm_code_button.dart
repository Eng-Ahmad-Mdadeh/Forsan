import 'package:flutter/material.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';

class ConfirmCodeButton extends StatelessWidget {
  const ConfirmCodeButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomSubmitButton(
      text: 'تأكيد',
      marginTop: 0,
      marginBottom: 0,
      onPressed: onPressed,
    );
  }
}
