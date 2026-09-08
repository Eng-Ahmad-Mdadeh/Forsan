import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/remove_zero_from_number.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/domain/entity/auth/auth_entity.dart';
import 'package:forsan/presentation/bloc/auth/login/login_bloc.dart';
import 'package:forsan/presentation/cubit/auth/login/login_cubit.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';

class ContinueLoginButton extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey;

  const ContinueLoginButton({super.key, required this.loginFormKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginCubitState>(
      builder: (context, cubitState) {
        return CustomSubmitButton(
          text: 'متابعة',
          marginTop: 0,
          marginBottom: 0,
          onPressed: () async {
            if (!(loginFormKey.currentState?.validate() ?? false)) return;

            final phone = cubitState.user?.phone ?? '';
            final dialCode = context.read<CodeCheckCubit>().state.dialCode;
            context.read<LoginCubit>().phoneChanged(phone);
            if (context.mounted) {
              context.read<LoginBloc>().add(
                LoginEvent(
                  AuthEntity(
                    phone: "$dialCode${phone.removeZero}",
                    typeMessage: 'sms',
                  ),
                ),
              );
              CheckCodeRoute().push(context);
            }
          },
        );
      },
    );
  }
}
