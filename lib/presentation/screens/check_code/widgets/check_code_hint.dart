import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class CheckCodeHint extends StatelessWidget {
  const CheckCodeHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppPaddingHeight.p17, bottom: AppPaddingHeight.p15),
      child: Column(
        children: [
          const BodyTitle(text: 'يمكنك طلب رمز جديد خلال', textAlign: TextAlign.center),
          SizedBox(height: AppHeight.h5),
          BlocBuilder<CodeCheckCubit, CodeCheckState>(
            builder: (context, state) {
              final isYellow = context.read<CodeCheckCubit>().lessThan5;
              final done = context.read<CodeCheckCubit>().done;
              return done
                  ? const BodyTitle(text: '00:00', color: AppColors.primary)
                  : TimerCountdown(
                      format: CountDownTimerFormat.minutesSeconds,
                      endTime: state.endDate,
                      enableDescriptions: false,
                      onEnd: context.read<CodeCheckCubit>().endTime,
                      timeTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: isYellow ? AppColors.secondary : AppColors.primary,
                        fontSize: AppFontSize.s16,
                      ),
                      spacerWidth: 2,
                    );
            },
          ),
        ],
      ),
    );
  }
}
