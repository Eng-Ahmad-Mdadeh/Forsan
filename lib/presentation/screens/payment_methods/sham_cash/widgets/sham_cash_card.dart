import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class ShamCashCard extends StatelessWidget {
  const ShamCashCard({
    super.key,
    required this.instruction,
    required this.accountNumber,
  });

  final String instruction;
  final String accountNumber;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: '$instruction $accountNumber',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r20),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.fromSTEB(
                AppPaddingWidth.p20,
                AppPaddingHeight.p24,
                AppPaddingWidth.p20,
                AppPaddingHeight.p20,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.bankTransferCardStart,
                    AppColors.bankTransferCardEnd,
                    AppColors.bankTransferCardStart,
                  ],
                  stops: [0, 0.52, 1],
                ),
                borderRadius: BorderRadius.circular(AppRadius.r20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SectionTitle(
                    text: instruction,
                    color: AppColors.white,
                    fontSize: AppFontSize.s16,
                    fontWeight: AppFontWeight.bold,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                  SizedBox(height: AppHeight.h8),
                  Container(
                    height: AppHeight.h55,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: AppPaddingWidth.p12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bankTransferField,
                      borderRadius: BorderRadius.circular(AppRadius.r12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card_outlined,
                          color: AppColors.white,
                          size: AppSize.s24,
                        ),
                        SizedBox(width: AppWidth.w8),
                        Expanded(
                          child: BodyTitle(
                            text: accountNumber,
                            color: AppColors.white,
                            fontSize: AppFontSize.s16,
                            fontWeight: AppFontWeight.bold,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(width: AppWidth.w8),
                        IconButton(
                          onPressed: () => Clipboard.setData(
                            ClipboardData(text: accountNumber),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 24,
                            minHeight: 24,
                          ),
                          tooltip:
                              MaterialLocalizations.of(context).copyButtonLabel,
                          visualDensity: VisualDensity.compact,
                          icon: Icon(
                            Icons.copy_outlined,
                            color: AppColors.white,
                            size: AppSize.s24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: -AppHeight.h130,
              end: -AppWidth.w12,
              child: Container(
                width: AppWidth.w170,
                height: AppHeight.h165,
                decoration: const BoxDecoration(
                  color: AppColors.bankTransferDecoration,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
