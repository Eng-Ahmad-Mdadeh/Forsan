import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_values.dart';
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
                    hintText: context.loc.signup_enter_full_name,
                    textInputType: TextInputType.name,
                    validator: _requiredValidator,
                  ),
                  SizedBox(height: AppHeight.h12),
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
  }
}
