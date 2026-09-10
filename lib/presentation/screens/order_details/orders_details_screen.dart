import 'package:flutter/material.dart';
import 'package:forsan/presentation/screens/order_details/widgets/order_details_header_card.dart';
import '../../../core/extension/localization_extension.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/required_action_card.dart';
import '../../widgets/text/body_title.dart';
import '../../widgets/text/section_title.dart';
import '../orders/models/order_item.dart';
import 'widgets/order_attached_documents_card.dart';
import 'widgets/order_documents_card.dart';
import 'widgets/order_stages_card.dart';
import 'widgets/order_summary_card.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key, required this.order});

  final OrderItem order;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: CustomAppBar(
      title: context.loc.order_details,
      backgroundColor: AppColors.white,
      toolbarHeight: AppHeight.h70,
      showBackButton: true,
      titleWidget: SectionTitle(
        text: context.loc.order_details,
        color: AppColors.mainText,
        fontSize: AppFontSize.s20,
        fontWeight: AppFontWeight.bold,
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p16,
          AppPaddingWidth.p16,
          AppPaddingHeight.p20,
        ),
        child: Column(
          children: [
            OrderDetailsHeaderCard(order: order),
            SizedBox(height: AppHeight.h16),
            RequiredActionCard(
              title: context.loc.order_required_action,
              message: context.loc.order_required_documents_message,
              buttonText: context.loc.order_complete_requirements,
              semanticsLabel: context.loc.order_required_action,
              onPressed: () => CompleteRequirementsRoute().push(context),
            ),
            SizedBox(height: AppHeight.h16),
            OrderSummaryCard(
              order: order,
              submittedBy: context.loc.order_submitter_abroad,
              service: context.loc.order_business_establishment,
              fees: context.loc.order_fees_after_review,
            ),
            SizedBox(height: AppHeight.h16),
            const OrderStagesCard(),
            SizedBox(height: AppHeight.h16),
            const OrderDocumentsCard(),
            SizedBox(height: AppHeight.h16),
            const OrderAttachedDocumentsCard(),
            SizedBox(height: AppHeight.h20),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    height: AppHeight.h52,
                    color: AppColors.homeSupportAction,
                    borderRadius: AppRadius.r12,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_rounded,
                          color: AppColors.white,
                          size: AppSize.s15,
                        ),
                        SizedBox(width: AppWidth.w5),
                        BodyTitle(
                          text: context.loc.order_approve_and_pay,
                          color: AppColors.white,
                          fontSize: AppFontSize.s12,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: AppWidth.w7),
                Expanded(
                  child: CustomElevatedButton(
                    height: AppHeight.h52,
                    color: AppColors.primary,
                    borderRadius: AppRadius.r12,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: AppColors.white,
                          size: AppSize.s15,
                        ),
                        SizedBox(width: AppWidth.w5),
                        Flexible(
                          child: BodyTitle(
                            text: context.loc.order_contact_consultant,
                            color: AppColors.white,
                            fontSize: AppFontSize.s12,
                          ),
                        ),
                      ],
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
