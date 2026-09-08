import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/remove_zero_from_number.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CheckCodeCardTitle extends StatelessWidget {
  const CheckCodeCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'تأكيد رقم الهاتف',
          color: AppColors.primary,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.extraBold,
        ),
        SizedBox(height: AppHeight.h5),
        BlocBuilder<CodeCheckCubit, CodeCheckState>(
          builder: (context, state) {
            final phone = state.phone.removeZero;
            final visibleDigits = phone.length > 3 ? phone.substring(phone.length - 3) : phone;
            final maskedPhone = '${state.dialCode}******$visibleDigits';
            return Directionality(
              textDirection: TextDirection.ltr,
              child: BodyTitle(
                text: 'تم إرسال رمز التحقق إلى $maskedPhone',
                color: AppColors.blackCow,
                fontSize: AppFontSize.s16,
                fontWeight: AppFontWeight.regular,
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ],
    );
  }
}
