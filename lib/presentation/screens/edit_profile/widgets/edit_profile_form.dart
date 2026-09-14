import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';

import 'edit_profile_dropdown.dart';
import 'edit_profile_header.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();

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
        children: [
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const EditProfileHeader(),
                  SizedBox(height: AppHeight.h20),
                  CustomInputField(
                    controller: _fullNameController,
                    title: context.loc.full_name,
                    hintText: context.loc.signup_enter_full_name,
                    textInputType: TextInputType.name,
                    backgroundColor: AppColors.white,
                    validator: _requiredValidator,
                  ),
                  SizedBox(height: AppHeight.h12),
                  EditProfileDropdown(
                    title: context.loc.country,
                    hintText: context.loc.signup_select_hint,
                    items: countries,
                    onChanged: context.read<EditProfileCubit>().selectCountry,
                  ),
                  SizedBox(height: AppHeight.h12),
                  EditProfileDropdown(
                    title: context.loc.signup_nationality,
                    hintText: context.loc.signup_select_hint,
                    items: nationalities,
                    onChanged:
                        context.read<EditProfileCubit>().selectNationality,
                  ),
                  SizedBox(height: AppHeight.h12),
                  CustomInputField(
                    controller: _emailController,
                    title: context.loc.email,
                    hintText: context.loc.signup_enter_email,
                    textInputType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
                    backgroundColor: AppColors.white,
                    validator: _emailValidator,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppHeight.h16),
          CustomSubmitButton(
            text: context.loc.save,
            icon: Icons.save_outlined,
            useGradient: false,
            onPressed: _save,
          ),
        ],
      ),
    );
  }

  void _save() {
    FocusManager.instance.primaryFocus?.unfocus();
    final fieldsAreValid = _formKey.currentState?.validate() ?? false;
    final selectionsAreValid = context
        .read<EditProfileCubit>()
        .state
        .hasRequiredSelections;
    if (!fieldsAreValid || !selectionsAreValid) return;
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.loc.complete_profile_required_field;
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.loc.complete_profile_email_required;
    }
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(value.trim())) {
      return context.loc.complete_profile_invalid_email;
    }
    return null;
  }
}
