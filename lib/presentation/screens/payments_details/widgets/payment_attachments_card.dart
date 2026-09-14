import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class PaymentAttachmentsCard extends StatelessWidget {
  const PaymentAttachmentsCard({super.key, this.onDownload});

  final VoidCallback? onDownload;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Semantics(
        container: true,
        label: 'المرفقات',
        child: SectionCard(
          showBorder: true,
          borderRadius: BorderRadius.circular(AppRadius.r12),
          padding: EdgeInsets.all(AppPaddingWidth.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _AttachmentsHeader(),
              SizedBox(height: AppHeight.h16),
              AspectRatio(
                aspectRatio: 2.3,
                child: ImageView(
                  imagePath: AppAssets.newOrder,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(AppRadius.r12),
                  semanticLabel: 'صورة الفاتورة',
                ),
              ),
              SizedBox(height: AppHeight.h12),
              Row(
                children: [
                  Expanded(
                    child: BodyTitle(
                      text: 'صورة الفاتورة',
                      color: AppColors.mainText,
                      fontSize: AppFontSize.s16,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                  Semantics(
                    button: true,
                    label: 'تحميل صورة الفاتورة',
                    child: InkWell(
                      onTap: onDownload ?? () {},
                      borderRadius: BorderRadius.circular(AppRadius.r8),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPaddingWidth.p4,
                          vertical: AppPaddingHeight.p4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BodyTitle(
                              text: 'تحميل',
                              color: AppColors.normal,
                              fontSize: AppFontSize.s16,
                              fontWeight: AppFontWeight.regular,
                            ),
                            SizedBox(width: AppWidth.w5),
                            Icon(
                              Icons.download_outlined,
                              color: AppColors.normal,
                              size: AppSize.s22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AttachmentsHeader extends StatelessWidget {
  const _AttachmentsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppWidth.w48,
          height: AppHeight.h48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.light.withOpacity(0.55),
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),
          child: Icon(
            Icons.attach_file,
            color: AppColors.normal,
            size: AppSize.s27,
          ),
        ),
        SizedBox(width: AppWidth.w10),
        Expanded(
          child: SectionTitle(
            text: 'المرفقات',
            color: AppColors.normal,
            fontSize: AppFontSize.s20,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ],
    );
  }
}
