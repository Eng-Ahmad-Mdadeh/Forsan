import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:forsan/core/extension/remove_zero_from_number.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/domain/entity/auth/auth_entity.dart';
import 'package:forsan/presentation/bloc/auth/check_code/check_code_bloc.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';

class VerificationCodeField extends StatelessWidget {
  final TextEditingController codeController;

  const VerificationCodeField({super.key, required this.codeController});

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: AppWidth.w70,
      height: AppHeight.h70,
      textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: AppColors.primary,
        fontSize: AppFontSize.s20,
        fontWeight: AppFontWeight.medium,
      ),
      decoration: BoxDecoration(color: AppColors.light, borderRadius: BorderRadius.circular(AppRadius.r7)),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(top: AppPaddingHeight.p20),
        child: Pinput(
          controller: codeController,
          length: 4,
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) => value?.length == 4 ? null : 'يرجى إدخال رمز التحقق كاملاً',
          defaultPinTheme: defaultTheme,
          focusedPinTheme: defaultTheme.copyWith(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.r7),
              border: Border.all(color: AppColors.primary),
            ),
          ),
          submittedPinTheme: defaultTheme.copyWith(
            decoration: BoxDecoration(color: AppColors.light, borderRadius: BorderRadius.circular(AppRadius.r7)),
          ),
          separatorBuilder: (index) => SizedBox(width: AppWidth.w10),
          cursor: Container(width: AppWidth.w1, height: AppHeight.h20, color: AppColors.primary),
        ),
      ),
    );
  }

  static void submit(BuildContext context, {required GlobalKey<FormState> formKey, required String code}) {
    if (!(formKey.currentState?.validate() ?? false) || code.length != 4) return;
    final state = context.read<CodeCheckCubit>().state;
    context.read<CheckCodeBloc>().add(
      CheckCodeEvent(
        AuthEntity(phone: '${state.dialCode}${state.phone.removeZero}', code: code, rememberMe: state.rememberMe),
      ),
    );
  }
}
