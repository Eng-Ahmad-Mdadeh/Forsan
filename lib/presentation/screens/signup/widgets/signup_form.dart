import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/screens/home/home_screen.dart';
import 'package:forsan/presentation/screens/signup/widgets/signup_dropdown_field.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _passportNumberController = TextEditingController();
  final _whatsappNumberController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _emailController = TextEditingController();

  String? _selectedCountry;
  String? _selectedNationality;

  @override
  void dispose() {
    _fullNameController.dispose();
    _cityController.dispose();
    _fatherNameController.dispose();
    _passportNumberController.dispose();
    _whatsappNumberController.dispose();
    _nationalIdController.dispose();
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

    return Form(
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
                    backgroundColor: AppColors.white,
                    hintText: context.loc.signup_enter_full_name,
                    textInputType: TextInputType.name,
                    validator: _requiredValidator,
                  ),
                  SizedBox(height: AppHeight.h12),
                  CustomInputField(
                    controller: _cityController,
                    title: context.loc.signup_city_name,
                    backgroundColor: AppColors.white,
                    hintText: context.loc.signup_enter_city_name,
                    textInputType: TextInputType.streetAddress,
                    validator: _requiredValidator,
                  ),

                  CustomInputField(
                    controller: _fatherNameController,
                    title: context.loc.signup_father_name,
                    backgroundColor: AppColors.white,
                    hintText: context.loc.signup_enter_father_name,
                    textInputType: TextInputType.name,
                    validator: _requiredValidator,
                  ),

                  SignupDropdownField(
                    title: context.loc.country,
                    hint: context.loc.signup_select_hint,
                    items: countries,
                    onChanged: (value) => setState(
                      () => _selectedCountry = value,
                    ),
                  ),
                  SizedBox(height: AppHeight.h12),
                  SignupDropdownField(
                    title: context.loc.signup_nationality,
                    hint: context.loc.signup_select_hint,
                    items: nationalities,
                    onChanged: (value) => setState(
                      () => _selectedNationality = value,
                    ),
                  ),
                  SizedBox(height: AppHeight.h12),
                  CustomInputField(
                    controller: _passportNumberController,
                    title: context.loc.signup_passport_number,
                    backgroundColor: AppColors.white,
                    hintText: context.loc.signup_enter_passport_number,
                    textInputType: TextInputType.text,
                    textDirection: TextDirection.ltr,
                    validator: _requiredValidator,
                  ),
                  CustomInputField(
                    controller: _whatsappNumberController,
                    title: context.loc.signup_whatsapp_number,
                    backgroundColor: AppColors.white,
                    hintText: context.loc.signup_enter_whatsapp_number,
                    textInputType: TextInputType.phone,
                    textDirection: TextDirection.ltr,
                    validator: _requiredValidator,
                  ),
                  CustomInputField(
                    controller: _nationalIdController,
                    title: context.loc.signup_national_id,
                    backgroundColor: AppColors.white,
                    hintText: context.loc.signup_enter_national_id,
                    textInputType: TextInputType.number,
                    textDirection: TextDirection.ltr,
                    validator: _requiredValidator,
                  ),
                  CustomInputField(
                    backgroundColor: AppColors.white,
                    controller: _emailController,
                    title: context.loc.email,
                    hintText: context.loc.signup_enter_email,
                    textInputType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
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

    HomeRoute().push(context);
  }
}
