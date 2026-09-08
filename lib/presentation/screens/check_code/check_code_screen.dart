import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/presentation/bloc/auth/check_code/check_code_bloc.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';
import 'package:forsan/presentation/screens/check_code/widgets/check_code_card.dart';
import 'package:forsan/presentation/widgets/image_view.dart';

class CheckCodeScreen extends StatelessWidget {
  const CheckCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<CheckCodeBloc>(create: (context) => CheckCodeBloc())],
      child: const _CheckCodeBody(),
    );
  }
}

class _CheckCodeBody extends StatefulWidget {
  const _CheckCodeBody();

  @override
  State<_CheckCodeBody> createState() => _CheckCodeBodyState();
}

class _CheckCodeBodyState extends State<_CheckCodeBody> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

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
            ImageView(imagePath: AppAssets.authBackground, fit: BoxFit.fill),
            LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  16,
                  constraints.maxHeight * .295,
                  16,
                  MediaQuery.viewInsetsOf(context).bottom + 24,
                ),
                child: Form(
                  key: _formKey,
                  child: CheckCodeCard(formKey: _formKey, codeController: _codeController),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
