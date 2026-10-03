import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/section_card.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';

class OrderAttachedDocumentsCard extends StatelessWidget {
  const OrderAttachedDocumentsCard({super.key, this.onDownload, this.model});

  final VoidCallback? onDownload;
  final OrderDetailsModel? model;

  @override
  Widget build(BuildContext context) => ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: model?.attachments?.length ?? 0,
    itemBuilder: (context, index) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Semantics(
          container: true,
          label: context.loc.order_attached_documents,
          child: SectionCard(
            showBorder: true,
            borderRadius: BorderRadius.circular(AppRadius.r8),
            padding: EdgeInsets.all(AppPaddingWidth.p16),

            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: AppWidth.w30,
                      height: AppHeight.h30,
                      decoration: BoxDecoration(
                        color: AppColors.light,
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.description_outlined,
                        color: AppColors.primaryDark,
                        size: AppSize.s22,
                      ),
                    ),
                    SizedBox(width: AppWidth.w10),
                    Expanded(
                      child: SectionTitle(
                        text: context.loc.order_attached_documents,
                        color: AppColors.secondaryText,
                        fontSize: AppFontSize.s14,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppHeight.h16),
                Container(
                  height: AppHeight.h55,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPaddingWidth.p16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backGround,
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.insert_drive_file_outlined,
                        color: AppColors.primaryDark,
                        size: AppSize.s16,
                      ),
                      SizedBox(width: AppWidth.w8),
                      Expanded(
                        child: BodyTitle(
                          text:  model?.attachments?[index].name??'',
                          color: AppColors.blackText,
                          fontSize: AppFontSize.s14,
                          fontWeight: AppFontWeight.regular,
                        ),
                      ),
                      InkWell(
                        onTap: onDownload ?? () {},
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                        child: Padding(
                          padding: EdgeInsets.all(AppPaddingWidth.p6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BodyTitle(
                                text: context.loc.property_download,
                                color: AppColors.primary,
                                fontSize: AppFontSize.s14,
                                fontWeight: AppFontWeight.regular,
                              ),
                              SizedBox(width: AppWidth.w6),
                              Icon(
                                Icons.download_for_offline_outlined,
                                color: AppColors.primaryDark,
                                size: AppSize.s16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
