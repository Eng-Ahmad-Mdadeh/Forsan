import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';
import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:forsan/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';

import '../../../bloc/auth/complete_profile/complete_profile_bloc.dart';
import '../../../widgets/custom_snack_bar.dart';
import '../../../widgets/loading_widget.dart';
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
    const countries = CountryCode.values;

    return BlocListener<CompleteProfileBloc, ICompleteProfileState>(
      listener: (context, state) {
        if (state is CompleteProfileLoading) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) =>
                const PopScope(canPop: false, child: LoadingWidget(0)),
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
          showCustomSnackBar(
            context: context,
            title: 'نجاح',
            message: 'تم حفظ التغييرات بنجاح',
            contentType: ContentType.success,
          );
          ShowProfileRoute().push(context);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const EditProfileHeader(),
                    SizedBox(height: AppHeight.h20),
                    CustomInputField(
                      controller: _fullNameController,
                      title: context.loc.full_name,
                      hintText: context.loc.complete_profile_enter_full_name,
                      textInputType: TextInputType.name,
                      backgroundColor: AppColors.white,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return context.loc.complete_profile_required_field;
                        }
                        return null;
                      },
                    ),
                    EditProfileDropdown(
                      title: context.loc.country,
                      hintText: context.loc.complete_profile_select_hint,
                      items: countries,
                      onChanged: context.read<EditProfileCubit>().countryChanged,
                    ),
                    SizedBox(height: AppHeight.h18),
                    EditProfileDropdown(
                      title: context.loc.complete_profile_nationality,
                      hintText: context.loc.complete_profile_select_hint,
                      items: countries,
                      onChanged: context.read<EditProfileCubit>().nationalityChanged,
                    ),
                    SizedBox(height: AppHeight.h18),
                    CustomInputField(
                      controller: _emailController,
                      title: context.loc.email,
                      hintText: context.loc.complete_profile_enter_email,
                      textInputType: TextInputType.emailAddress,
                      textDirection: TextDirection.ltr,
                      backgroundColor: AppColors.white,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return context.loc.complete_profile_email_required;
                        }
                        if (!RegExp(
                          r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                        ).hasMatch(value.trim())) {
                          return context.loc.complete_profile_invalid_email;
                        }
                        return null;
                      },
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
              onPressed: (){
                final user = context.read<EditProfileCubit>().state.user;
                context.read<CompleteProfileBloc>().add(
                  CompleteProfileEvent(
                    AuthEntity(
                      fullName: user?.fullName,
                      email: user?.email,
                      country: user?.country,
                      nationality: user?.nationality,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
