import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/document_requirement_card.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/uploaded_document_card.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class DocumentsStep extends StatelessWidget {
  const DocumentsStep({super.key});

  Future<void> _pickDocuments(BuildContext context) async {
    final rejectedDocuments = await context.read<NewOrderCubit>().pickDocuments();

    if (!context.mounted || rejectedDocuments == 0) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: BodyTitle(
          text: context.loc.new_order_documents_size_error,
          color: AppColors.white,
          fontWeight: AppFontWeight.regular,
        ),
        backgroundColor: AppColors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewOrderCubit, NewOrderState>(
      buildWhen: (previous, current) => previous.documents != current.documents,
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppPaddingWidth.p16,
            vertical: AppPaddingHeight.p8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(
                    Iconsax.activity_outline,
                    size: AppSize.s16,
                    color: AppColors.secondary,
                  ),
                  SizedBox(width: AppWidth.w4),
                  Expanded(
                    child: SectionTitle(
                      text: context.loc.new_order_documents_available_title,
                      color: AppColors.primaryDark,
                      fontSize: AppFontSize.s14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppHeight.h8),
              BodyTitle(
                text:
                    context.loc.new_order_documents_available_description,
                color: AppColors.secondaryText,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.regular,
                maxLines: 2,
              ),
              SizedBox(height: AppHeight.h16),
              DocumentRequirementCard(
                title: context.loc.new_order_document_authorization,
                availability: context.loc.new_order_document_if_available,
                icon: Icons.add_moderator_outlined,
              ),
              SizedBox(height: AppHeight.h10),
              DocumentRequirementCard(
                title: context.loc.new_order_document_identity,
                availability: context.loc.new_order_document_required_when_available,
                icon: Icons.badge_outlined,
              ),
              SizedBox(height: AppHeight.h10),
              DocumentRequirementCard(
                title: context.loc.new_order_document_headquarters,
                availability: context.loc.new_order_document_if_available,
                icon: Icons.description_outlined,
              ),
              SizedBox(height: AppHeight.h24),
              SectionTitle(
                text: context.loc.new_order_attachments,
                color: AppColors.mainText,
                fontSize: AppFontSize.s14,
                textAlign: TextAlign.right,
              ),
              DocumentSection(
                image: null,
                onTap: () => _pickDocuments(context),
                paddingTop: AppPaddingHeight.p1,
                uploadLabel: context.loc.new_order_upload_tap,
                uploadHint: context.loc.new_order_upload_hint,
              ),
              if (state.documents.isNotEmpty) ...[
                SizedBox(height: AppHeight.h20),
                ...state.documents.map(
                  (document) => Padding(
                    padding: EdgeInsets.only(bottom: AppPaddingHeight.p16),
                    child: UploadedDocumentCard(
                      document: document,
                      onRemove: () => context
                          .read<NewOrderCubit>()
                          .removeDocument(document),
                    ),
                  ),
                ),
              ],
              SizedBox(height: AppHeight.h26),
              SectionCard(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(
                  horizontal: AppPaddingWidth.p12,
                  vertical: AppPaddingHeight.p10,
                ),
                borderRadius: BorderRadius.circular(AppRadius.r7),
                backgroundColor: AppColors.goldBackGround,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: AppColors.mainText,
                      size: AppSize.s20,
                    ),
                    SizedBox(width: AppWidth.w8),
                    Expanded(
                      child: BodyTitle(
                        text: 'تحفظ الملفات ضمن ملف الطلب وتستخدم فقط لأغراض دراسة وتنفيذ الخدمة.',
                        color: AppColors.mainText,
                        fontSize: AppFontSize.s12,
                        fontWeight: AppFontWeight.regular,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppHeight.h50),

            ],
          ),
        );
      },
    );
  }
}
