import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_step_indicator.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/option_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  String _establishmentType = 'new';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToStep(int step) {
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _EstablishmentTypeStep(
        selectedValue: _establishmentType,
        onChanged: (value) => setState(() => _establishmentType = value),
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
        onTapBackButton: _currentStep == 0
            ? () => Navigator.of(context).pop()
            : () => _goToStep(_currentStep - 1),
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
            Divider(height: AppHeight.h1, color: AppColors.lightGrey),
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppPaddingWidth.p20,
                AppPaddingHeight.p18,
                AppPaddingWidth.p20,
                AppPaddingHeight.p14,
              ),
              child: OrderStepIndicator(currentStep: _currentStep),
            ),
            Expanded(
              child: PageView.builder(
                key: const Key('new_order_page_view'),
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) => setState(() => _currentStep = index),
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
                  if (_currentStep < pages.length - 1) {
                    _goToStep(_currentStep + 1);
                  }
                },
                child: BodyTitle(
                  text: _currentStep == pages.length - 1
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
  });

  final String selectedValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return _StepBody(
      title: context.loc.new_order_establishment_title,
      description: context.loc.new_order_establishment_description,
      children: [
        OptionCard(
          title: context.loc.new_order_new_company,
          option: 'new',
          selectedOption: selectedValue,
          onChanged: onChanged,
        ),
        SizedBox(height: AppHeight.h12),
        OptionCard(
          title: context.loc.new_order_company_branch,
          option: 'branch',
          selectedOption: selectedValue,
          onChanged: onChanged,
        ),
      ],
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
