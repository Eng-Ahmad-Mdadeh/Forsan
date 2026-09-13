import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/activity_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/applicant_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/documents_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/establishment_type_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/order_step_indicator.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/ownership_structure_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/proposed_company_info_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/review_step.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToStep(BuildContext context, int step) {
    context.read<NewOrderCubit>().changeStep(step);
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewOrderCubit(),
      child: BlocBuilder<NewOrderCubit, NewOrderState>(
        builder: (context, state) => _buildScreen(context, state),
      ),
    );
  }

  Widget _buildScreen(BuildContext context, NewOrderState state) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: context.loc.new_order_title,
        backgroundColor: AppColors.white,
        showBackButton: true,
        showScrolledUnderElevation: false,
        onTapBackButton: state.currentStep == 0
            ? () => Navigator.of(context).pop()
            : () => _goToStep(context, state.currentStep - 1),
        customActions: [
          HeaderIconButton(
            icon: Icons.close_rounded,
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppPaddingWidth.p20,
                AppPaddingHeight.p18,
                AppPaddingWidth.p20,
                AppPaddingHeight.p14,
              ),
              child: OrderStepIndicator(currentStep: state.currentStep),
            ),
            Expanded(
              child: PageView(
                key: const Key('new_order_page_view'),
                controller: _pageController,
                onPageChanged: context.read<NewOrderCubit>().changeStep,
                children: [
                  EstablishmentTypeStep(
                    selectedValue: state.establishmentType,
                    onChanged:
                        context.read<NewOrderCubit>().selectEstablishmentType,
                    selectedApplicantValue: state.applicantType,
                    onApplicantChanged:
                        context.read<NewOrderCubit>().selectApplicantType,
                  ),
                  const ApplicantStep(),
                  const ProposedCompanyInfoStep(),
                  const OwnershipStructureStep(),
                   ActivityStep(),
                   DocumentsStep(),
                  const ReviewStep(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppPaddingWidth.p16,
                AppPaddingHeight.p8,
                AppPaddingWidth.p16,
                AppPaddingHeight.p16,
              ),
              child: CustomElevatedButton(
                key: const Key('new_order_next_button'),
                width: double.infinity,
                height: AppHeight.h50,
                color: AppColors.primary,
                onPressed: () {
                  if (state.currentStep < NewOrderCubit.lastStep) {
                    _goToStep(context, state.currentStep + 1);
                  }
                },
                child: BodyTitle(
                  text: state.currentStep == NewOrderCubit.lastStep
                      ? context.loc.new_order_submit
                      : context.loc.new_order_next,
                  color: AppColors.white,
                  fontWeight: AppFontWeight.semiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
