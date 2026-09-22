import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';
import 'package:forsan/presentation/bloc/auth/complete_profile/complete_profile_bloc.dart';
import 'package:forsan/presentation/cubit/auth/complete_profile/complete_profile_cubit.dart';
import 'package:forsan/presentation/screens/complete_profile/widgets/complete_profile_dropdown_field.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/custom_snack_bar.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/loading_widget.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
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
    const countries = CountryCode.values;

    return BlocListener<CompleteProfileBloc, ICompleteProfileState>(
      listener: (context, state) {
        if (state is CompleteProfileLoading) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) => const PopScope(
              canPop: false,
              child: LoadingWidget(0),
            ),
          );
        } else if (state is CompleteProfileFailed) {
          Navigator.of(context, rootNavigator: true).pop();
          showCustomSnackBar(
            context: context,
            title: context.loc.complete_profile_error_title,
            message: state.message,
            contentType: ContentType.failure,
          );
        } else if (state is CompleteProfileLoaded) {
          Navigator.of(context, rootNavigator: true).pop();
          HomeRoute().push(context);
        }
      },
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
                      backgroundColor: AppColors.white,
                      hintText: context.loc.complete_profile_enter_full_name,
                      textInputType: TextInputType.name,
                      onChanged: context
                          .read<CompleteProfileCubit>()
                          .fullNameChanged,
                      validator: _requiredValidator,
                    ),
                    SizedBox(height: AppHeight.h12),

                    CompleteProfileDropdownField(
                      title: context.loc.country,
                      hint: context.loc.complete_profile_select_hint,
                      items: countries,
                      onChanged: context
                          .read<CompleteProfileCubit>()
                          .countryChanged,
                    ),
                    SizedBox(height: AppHeight.h12),
                    CompleteProfileDropdownField(
                      title: context.loc.complete_profile_nationality,
                      hint: context.loc.complete_profile_select_hint,
                      items: countries,
                      onChanged: context
                          .read<CompleteProfileCubit>()
                          .nationalityChanged,
                    ),
                    SizedBox(height: AppHeight.h12),

                    CustomInputField(
                      backgroundColor: AppColors.white,
                      controller: _emailController,
                      title: context.loc.email,
                      hintText: context.loc.complete_profile_enter_email,
                      textInputType: TextInputType.emailAddress,
                      textDirection: TextDirection.ltr,
                      onChanged: context
                          .read<CompleteProfileCubit>()
                          .emailChanged,
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
    final selectionsAreValid = context
        .read<CompleteProfileCubit>()
        .state
        .hasRequiredSelections;
    if (!fieldsAreValid || !selectionsAreValid) {
      return;
    }

    final user = context.read<CompleteProfileCubit>().state.user;
    context.read<CompleteProfileBloc>().add(CompleteProfileEvent(user));
  }
}
