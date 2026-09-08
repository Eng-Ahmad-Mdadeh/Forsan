import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/presentation/bloc/auth/login/login_bloc.dart';
import 'package:forsan/presentation/cubit/auth/login/login_cubit.dart';
import 'package:forsan/presentation/widgets/image_view.dart';

import 'widgets/login_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
      ],
      child: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody();

  @override
  State<_LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<_LoginBody> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.light,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: .12,
              child: ImageView(
                imagePath: AppAssets.appBackground,
                fit: BoxFit.cover,
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  16,
                  constraints.maxHeight * .08,
                  16,
                  MediaQuery.viewInsetsOf(context).bottom + 24,
                ),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      ImageView(
                        imagePath: AppAssets.fullLogo,
                        width: 270,
                        height: 140,
                        fit: BoxFit.contain,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 16),
                      LoginCard(loginFormKey: _loginFormKey),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
