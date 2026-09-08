import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/bloc/auth/check_code/check_code_bloc.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';
import 'package:forsan/presentation/screens/check_code/widgets/check_code_actions.dart';
import 'package:forsan/presentation/screens/check_code/widgets/check_code_card_title.dart';
import 'package:forsan/presentation/screens/check_code/widgets/check_code_hint.dart';
import 'package:forsan/presentation/screens/check_code/widgets/confirm_code_button.dart';
import 'package:forsan/presentation/screens/check_code/widgets/verification_code_field.dart';
import 'package:forsan/presentation/widgets/custom_snack_bar.dart';
import 'package:forsan/presentation/widgets/loading_widget.dart';

import 'package:forsan/core/extension/localization_extension.dart';

class CheckCodeCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController codeController;

  const CheckCodeCard({super.key, required this.formKey, required this.codeController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckCodeBloc, ICheckCodeState>(
      listener: (context, state) async {
        if (state is CheckCodeLoading) {
          showDialog(
            context: context,
            builder: (context) => const PopScope(canPop: false, child: LoadingWidget(0)),
          );
        }
        if (state is CheckCodeLoaded) {
          context.pop();
          if (context.mounted) {
            SignupRoute().go(context);
          }
        }
        if (state is CheckCodeFailed && context.mounted) {
          context.pop();
          showCustomSnackBar(
            context: context,
            title: 'error',
            message: state.message,
            contentType: ContentType.failure,
          );
        }
        if (state is ResendCodeSuccess && context.mounted) {
          context.pop();
          context.read<CodeCheckCubit>().resetTime();
          showCustomSnackBar(
            context: context,
            title: context.loc.success,
            message: context.loc.code_sent,
            contentType: ContentType.success,
          );
        }
      },

      child: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.fromSTEB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p23,
          AppPaddingWidth.p16,
          AppPaddingHeight.p18,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CheckCodeCardTitle(),
            VerificationCodeField(codeController: codeController),
            const CheckCodeHint(),
            const CheckCodeActions(),
            SizedBox(height: AppHeight.h22),
            ConfirmCodeButton(
              onPressed: () => VerificationCodeField.submit(
                context,
                formKey: formKey,
                code: codeController.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
