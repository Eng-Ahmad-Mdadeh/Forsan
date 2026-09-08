import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:forsan/core/extension/remove_zero_from_number.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/domain/entity/auth/auth_entity.dart';
import 'package:forsan/presentation/bloc/auth/check_code/check_code_bloc.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';
import 'package:forsan/presentation/screens/check_code/widgets/check_code_action_button.dart';

class CheckCodeActions extends StatelessWidget {
  const CheckCodeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeCheckCubit, CodeCheckState>(
      builder: (context, state) {
        final done = context.read<CodeCheckCubit>().done;
        return Row(
          children: [
            Expanded(
              child: CheckCodeActionButton(
                label: 'رسالة نصية',
                icon: Iconsax.sms_outline,
                iconColor: done ? AppColors.secondary : AppColors.greyText,
                onTap: done ? () => _resend(context, state, 'sms') : null,
              ),
            ),
            SizedBox(width: AppWidth.w12),
            Expanded(
              child: CheckCodeActionButton(
                label: 'واتساب',
                icon: Iconsax.whatsapp_outline,
                iconColor: done ? AppColors.darkGreen : AppColors.greyText,
                onTap: done ? () => _resend(context, state, 'whatsapp') : null,
              ),
            ),
          ],
        );
      },
    );
  }

  void _resend(BuildContext context, CodeCheckState state, String type) {
    context.read<CodeCheckCubit>().setType(type, state.dialCode);
    context.read<CheckCodeBloc>().add(
      ResendCodeEvent(
        AuthEntity(
          phone: '${state.dialCode}${state.phone.removeZero}',
          rememberMe: state.rememberMe,
          typeMessage: type,
        ),
      ),
    );
  }
}
