import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class BankTransferCard extends StatelessWidget {
  const BankTransferCard({
    super.key,
    required this.bankLabel,
    required this.bankName,
    required this.beneficiaryLabel,
    required this.beneficiaryName,
    required this.accountNumberLabel,
    required this.accountNumber,
    required this.ibanLabel,
    required this.iban,
  });

  final String bankLabel;
  final String bankName;
  final String beneficiaryLabel;
  final String beneficiaryName;
  final String accountNumberLabel;
  final String accountNumber;
  final String ibanLabel;
  final String iban;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
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
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    AppColors.bankTransferCardStart,
                    AppColors.bankTransferCardEnd,
                  ],
                ),
                borderRadius: BorderRadius.circular(AppRadius.r20),
              ),
              child: Column(
                children: [
                  _BankDetail(
                    label: bankLabel,
                    value: bankName,
                    icon: Icons.account_balance_outlined,
                  ),
                  SizedBox(height: AppHeight.h16),
                  _BankDetail(
                    label: beneficiaryLabel,
                    value: beneficiaryName,
                    icon: Icons.person_outline_rounded,
                  ),
                  SizedBox(height: AppHeight.h16),
                  _BankDetail(
                    label: accountNumberLabel,
                    value: accountNumber,
                    icon: Icons.credit_card_outlined,
                    onCopy: () => _copy(accountNumber),
                  ),
                  SizedBox(height: AppHeight.h16),
                  _BankDetail(
                    label: ibanLabel,
                    value: iban,
                    icon: Icons.credit_card_outlined,
                    onCopy: () => _copy(iban),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: -AppHeight.h60,
              start: -AppWidth.w45,
              child: Container(
                width: AppWidth.w200,
                height: AppHeight.h130,
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

  Future<void> _copy(String value) =>
      Clipboard.setData(ClipboardData(text: value));
}

class _BankDetail extends StatelessWidget {
  const _BankDetail({
    required this.label,
    required this.value,
    required this.icon,
    this.onCopy,
  });

  final String label;
  final String value;
  final IconData icon;
  final VoidCallback? onCopy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(
          text: label,
          color: AppColors.white,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.bold,
          textAlign: TextAlign.start,
          maxLines: 1,
        ),
        SizedBox(height: AppHeight.h7),
        Container(
          constraints: BoxConstraints(minHeight: AppHeight.h60),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppPaddingWidth.p16,
            vertical: AppPaddingHeight.p12,
          ),
          decoration: BoxDecoration(
            color: AppColors.bankTransferField,
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.white, size: AppSize.s25),
              SizedBox(width: AppWidth.w12),
              Expanded(
                child: BodyTitle(
                  text: value,
                  color: AppColors.white,
                  fontSize: AppFontSize.s18,
                  fontWeight: onCopy == null
                      ? AppFontWeight.regular
                      : AppFontWeight.bold,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              if (onCopy != null) ...[
                SizedBox(width: AppWidth.w8),
                IconButton(
                  onPressed: onCopy,
                  tooltip: MaterialLocalizations.of(context).copyButtonLabel,
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tightFor(
                    width: AppWidth.w40,
                    height: AppHeight.h40,
                  ),
                  icon: Icon(
                    Icons.copy_outlined,
                    color: AppColors.white,
                    size: AppSize.s24,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
