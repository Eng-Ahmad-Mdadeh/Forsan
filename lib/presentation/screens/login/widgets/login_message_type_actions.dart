import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/auth/login/login_cubit.dart';
import 'package:forsan/presentation/screens/check_code/widgets/check_code_action_button.dart';

class LoginMessageTypeActions extends StatelessWidget {
  const LoginMessageTypeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginCubitState>(
      buildWhen: (previous, current) =>
          previous.messageType != current.messageType,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: CheckCodeActionButton(
                label: 'رسالة نصية',
                icon: Iconsax.sms_outline,
                iconColor: state.messageType == 'sms'
                    ? AppColors.secondary
                    : AppColors.greyText,
                onTap: () =>
                    context.read<LoginCubit>().messageTypeChanged('sms'),
              ),
            ),
            SizedBox(width: AppWidth.w12),
            Expanded(
              child: CheckCodeActionButton(
                label: 'واتساب',
                icon: Iconsax.whatsapp_outline,
                iconColor: state.messageType == 'whatsapp'
                    ? AppColors.darkGreen
                    : AppColors.greyText,
                onTap: () => context
                    .read<LoginCubit>()
                    .messageTypeChanged('whatsapp'),
              ),
            ),
          ],
        );
      },
    );
  }
}
