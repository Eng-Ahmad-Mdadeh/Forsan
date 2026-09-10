import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/order_option_card.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/order_step_indicator.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

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
    final pages = <Widget>[
      _EstablishmentTypeStep(
        selectedValue: state.establishmentType,
        onChanged: context.read<NewOrderCubit>().selectEstablishmentType,
        selectedApplicantValue: state.applicantType,
        onApplicantChanged: context.read<NewOrderCubit>().selectApplicantType,
      ),
      const _ApplicantStep(),
      const _CompanyDataStep(),
    ];

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
              child: PageView.builder(
                key: const Key('new_order_page_view'),
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: context.read<NewOrderCubit>().changeStep,
                itemBuilder: (context, index) => pages[index],
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

class _StepBody extends StatelessWidget {
  const _StepBody({
    required this.title,
    required this.description,
    required this.children,
  });

  final String title;
  final String description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionTitle(text: title, fontSize: AppFontSize.s18),
          SizedBox(height: AppHeight.h6),
          BodyTitle(
            text: description,
            color: AppColors.greyText,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
          ),
          SizedBox(height: AppHeight.h20),
          ...children,
        ],
      ),
    );
  }
}

class _EstablishmentTypeStep extends StatelessWidget {
  const _EstablishmentTypeStep({
    required this.selectedValue,
    required this.onChanged,
    required this.selectedApplicantValue,
    required this.onApplicantChanged,
  });

  final String selectedValue;
  final ValueChanged<String> onChanged;
  final String selectedApplicantValue;
  final ValueChanged<String> onApplicantChanged;

  @override
  Widget build(BuildContext context) {
    final options = [
      (
        value: 'one_person',
        title: context.loc.new_order_one_person_company,
        description: context.loc.new_order_one_person_company_description,
        icon: Icons.person_outline_rounded,
      ),
      (
        value: 'limited_liability',
        title: context.loc.new_order_limited_liability_company,
        description:
            context.loc.new_order_limited_liability_company_description,
        icon: Icons.domain_outlined,
      ),
      (
        value: 'foreign_partner',
        title: context.loc.new_order_foreign_partner_company,
        description: context.loc.new_order_foreign_partner_company_description,
        icon: Icons.public_rounded,
      ),
      (
        value: 'individual',
        title: context.loc.new_order_individual_establishment,
        description:
            context.loc.new_order_individual_establishment_description,
        icon: Icons.account_tree_outlined,
      ),
      (
        value: 'joint_stock',
        title: context.loc.new_order_joint_stock_company,
        description: context.loc.new_order_joint_stock_company_description,
        icon: Icons.groups_2_outlined,
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p10,
        AppPaddingHeight.p8,
        AppPaddingWidth.p10,
        AppPaddingHeight.p16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.grid_view_rounded,
                size: AppSize.s17,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w6),
              Expanded(
                child: SectionTitle(
                  text: context.loc.new_order_establishment_title,
                  color: AppColors.primary,
                  fontSize: AppFontSize.s18,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h4),
          BodyTitle(
            text: context.loc.new_order_establishment_description,
            color: AppColors.greyText,
            fontSize: AppFontSize.s13,
            fontWeight: AppFontWeight.regular,
            maxLines: 2,
          ),
          SizedBox(height: AppHeight.h10),
          for (final option in options) ...[
            OrderOptionCard(
              title: option.title,
              description: option.description,
              icon: option.icon,
              selected: selectedValue == option.value,
              onTap: () => onChanged(option.value),
            ),
            SizedBox(height: AppHeight.h12),
          ],
          SizedBox(height: AppHeight.h8),
          _ApplicantRoleSection(
            selectedValue: selectedApplicantValue,
            onChanged: onApplicantChanged,
          ),
        ],
      ),
    );
  }
}

class _ApplicantStep extends StatelessWidget {
  const _ApplicantStep();

  @override
  Widget build(BuildContext context) {
    return _StepBody(
      title: context.loc.new_order_applicant_title,
      description: context.loc.new_order_applicant_description,
      children: [
        CustomInputField(
          title: context.loc.new_order_full_name,
          hintText: context.loc.new_order_full_name,
          req: true,
        ),
        SizedBox(height: AppHeight.h16),
        CustomInputField(
          title: context.loc.new_order_phone,
          hintText: context.loc.new_order_phone,
          textInputType: TextInputType.phone,
          req: true,
        ),
      ],
    );
  }
}

class _ApplicantRoleSection extends StatelessWidget {
  const _ApplicantRoleSection({
    required this.selectedValue,
    required this.onChanged,
  });

  final String selectedValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final options = [
      (
        value: 'syrian_citizen',
        title: context.loc.new_order_syrian_citizen,
        description: context.loc.new_order_syrian_citizen_description,
        icon: Icons.account_circle_outlined,
      ),
      (
        value: 'expatriate',
        title: context.loc.new_order_expatriate,
        description: context.loc.new_order_expatriate_description,
        icon: Icons.flight_takeoff_rounded,
      ),
      (
        value: 'foreign_investor',
        title: context.loc.new_order_foreign_investor,
        description: context.loc.new_order_foreign_investor_description,
        icon: Icons.person_add_alt_outlined,
      ),
      (
        value: 'company_representative',
        title: context.loc.new_order_company_representative,
        description: context.loc.new_order_company_representative_description,
        icon: Icons.manage_accounts_outlined,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              Icons.person_outline_rounded,
              size: AppSize.s17,
              color: AppColors.secondary,
            ),
            SizedBox(width: AppWidth.w6),
            Expanded(
              child: SectionTitle(
                text: context.loc.new_order_applicant_role_title,
                color: AppColors.primary,
                fontSize: AppFontSize.s18,
              ),
            ),
          ],
        ),
        SizedBox(height: AppHeight.h4),
        BodyTitle(
          text: context.loc.new_order_applicant_role_description,
          color: AppColors.greyText,
          fontSize: AppFontSize.s13,
          fontWeight: AppFontWeight.regular,
          maxLines: 2,
        ),
        SizedBox(height: AppHeight.h10),
        for (final option in options) ...[
          OrderOptionCard(
            title: option.title,
            description: option.description,
            icon: option.icon,
            height: AppHeight.h75,
            selected: selectedValue == option.value,
            onTap: () => onChanged(option.value),
          ),
          SizedBox(height: AppHeight.h12),
        ],
      ],
    );
  }
}

class _CompanyDataStep extends StatelessWidget {
  const _CompanyDataStep();

  @override
  Widget build(BuildContext context) {
    return _StepBody(
      title: context.loc.new_order_company_title,
      description: context.loc.new_order_company_description,
      children: [
        CustomInputField(
          title: context.loc.new_order_company_name,
          hintText: context.loc.new_order_company_name,
          req: true,
        ),
        SizedBox(height: AppHeight.h16),
        CustomInputField(
          title: context.loc.new_order_company_activity,
          hintText: context.loc.new_order_company_activity,
          req: true,
        ),
      ],
    );
  }
}
