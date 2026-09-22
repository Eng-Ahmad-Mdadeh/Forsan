import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/screens/complete_profile/widgets/complete_profile_dropdown_field.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
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
      context.loc.complete_profile_saudi_arabia,
      context.loc.complete_profile_kuwait,
    ];
    final nationalities = [
      context.loc.complete_profile_saudi,
      context.loc.complete_profile_kuwaiti,
    ];

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomInputField(
                    controller: _fullNameController,
                    title: context.loc.full_name,
                    backgroundColor: AppColors.white,
                    hintText: context.loc.complete_profile_enter_full_name,
                    textInputType: TextInputType.name,
                    validator: _requiredValidator,
                  ),
                  SizedBox(height: AppHeight.h12),

                  CompleteProfileDropdownField(
                    title: context.loc.country,
                    hint: context.loc.complete_profile_select_hint,
                    items: countries,
                    onChanged: (value) =>
                        setState(() => _selectedCountry = value),
                  ),
                  SizedBox(height: AppHeight.h12),
                  CompleteProfileDropdownField(
                    title: context.loc.complete_profile_nationality,
                    hint: context.loc.complete_profile_select_hint,
                    items: nationalities,
                    onChanged: (value) =>
                        setState(() => _selectedNationality = value),
                  ),
                  SizedBox(height: AppHeight.h12),

                  CustomInputField(
                    backgroundColor: AppColors.white,
                    controller: _emailController,
                    title: context.loc.email,
                    hintText: context.loc.complete_profile_enter_email,
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
