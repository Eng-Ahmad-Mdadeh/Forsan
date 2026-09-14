import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/screens/setting/widgets/setting_view.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => SettingCubit(),
    child: const SettingView(),
  );
}
