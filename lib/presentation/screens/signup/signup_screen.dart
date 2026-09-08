import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();

  String? _selectedCountry;
  String? _selectedNationality;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countries = [
      context.loc.signup_saudi_arabia,
      context.loc.signup_kuwait,
    ];
    final nationalities = [
      context.loc.signup_saudi,
      context.loc.signup_kuwaiti,
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          title: context.loc.signup_account_information,
          backgroundColor: AppColors.white,
          showBackButton: true,
          showScrolledUnderElevation: false,
          onTapBackButton: () => Navigator.maybePop(context),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppPaddingWidth.p16,
              AppPaddingHeight.p12,
              AppPaddingWidth.p16,
              AppPaddingHeight.p24,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomInputField(
                            controller: _fullNameController,
                            title: context.loc.full_name,
                            hintText: context.loc.signup_enter_full_name,
                            textInputType: TextInputType.name,
                            validator: _requiredValidator,
                          ),
                          SizedBox(height: AppHeight.h12),
                          _SignupDropDown(
                            title: context.loc.country,
                            hint: context.loc.signup_select_hint,
                            items: countries,
                            onChanged: (value) => setState(
                              () => _selectedCountry = value as String?,
                            ),
                          ),
                          SizedBox(height: AppHeight.h12),
                          _SignupDropDown(
                            title: context.loc.signup_nationality,
                            hint: context.loc.signup_select_hint,
                            items: nationalities,
                            onChanged: (value) => setState(
                              () => _selectedNationality = value as String?,
                            ),
                          ),
                          SizedBox(height: AppHeight.h12),
                          CustomInputField(
                            controller: _emailController,
                            title: context.loc.email,
                            hintText: context.loc.signup_enter_email,
                            textInputType: TextInputType.emailAddress,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.end,
                            validator: _emailValidator,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppHeight.h16),
                  CustomSubmitButton(
                    text: context.loc.confirm,
                    useGradient: false,
                    onPressed: _submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.loc.complete_profile_required_field;
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.loc.complete_profile_required_field;
    }
    final emailPattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailPattern.hasMatch(value.trim())) {
      return context.loc.complete_profile_invalid_email;
    }
    return null;
  }

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    final fieldsAreValid = _formKey.currentState?.validate() ?? false;
    if (!fieldsAreValid ||
        _selectedCountry == null ||
        _selectedNationality == null) {
      return;
    }
  }
}

class _SignupDropDown extends StatelessWidget {
  const _SignupDropDown({
    required this.title,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  final String title;
  final String hint;
  final List<String> items;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BodyTitle(
          text: title,
          textAlign: TextAlign.start,
          fontSize: AppFontSize.s15,
          fontWeight: AppFontWeight.bold,
          color: AppColors.secondary,
        ),
        SizedBox(height: AppHeight.h4),
        CustomDropDownWidget(
          items: items,
          isStringList: true,
          hintText: hint,
          color: AppColors.backGround,
          height: AppHeight.h50,
          borderRadius: AppRadius.r7,
          closedBorder: const Border.fromBorderSide(
            BorderSide(color: AppColors.greyDivider, width: .7),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
