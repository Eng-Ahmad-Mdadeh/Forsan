import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../cubit/invoices_and_payments/invoices_and_payments_cubit.dart';

class InvoicesAndPaymentsTabs extends StatelessWidget {
  const InvoicesAndPaymentsTabs({super.key});

  static const _labels = ['الكل', 'مدفوع', 'غير مدفوع'];

  @override
  Widget build(BuildContext context) => BlocBuilder<InvoicesAndPaymentsCubit, int>(
    builder: (context, selectedIndex) => Container(
      height: AppHeight.h55,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p5,
        vertical: AppPaddingHeight.p5,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGreySec,
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Row(
        children: List.generate(_labels.length, (index) {
          return Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                end: index == _labels.length - 1 ? 0 : AppPaddingWidth.p5,
              ),
              child: _PaymentTab(
                label: _labels[index],
                selected: selectedIndex == index,
                onTap: () => context
                    .read<InvoicesAndPaymentsCubit>()
                    .selectTab(index),
              ),
            ),
          );
        }),
      ),
    ),
  );
}

class _PaymentTab extends StatelessWidget {
  const _PaymentTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.r10);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.white,
        borderRadius: radius,
        border: Border.all(
          color: selected ? AppColors.secondary : AppColors.lightGrey,
          width: selected ? AppWidth.w1 : .5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.homeSoftShadow,
            blurRadius: AppRadius.r8,
            offset: Offset(0, AppHeight.h3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: selected ? AppColors.white : AppColors.mainText,
                  fontFamily: AppFontFamily.tajawal,
                  fontSize: AppFontSize.s18,
                  fontWeight: AppFontWeight.regular,
                ),
              ),
              if (selected)
                Positioned(
                  bottom: -AppHeight.h5,
                  child: Container(
                    width: AppWidth.w26,
                    height: AppHeight.h10,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppRadius.r10),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
