import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.onFinished, super.key});

  final VoidCallback onFinished;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _navigationTimer = Timer(AppDurations.splash, () {
      if (mounted) widget.onFinished();
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarColor: AppColors.splashBackground,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.splashBackground,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    child: Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          ExcludeSemantics(
            child: Opacity(
              opacity: .28,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  AppColors.splashPattern,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  AppAssets.appBackground,
                  repeat: ImageRepeat.repeat,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: FractionallySizedBox(
                widthFactor: .55,
                child: Image.asset(
                  AppAssets.fullLogo,
                  fit: BoxFit.contain,
                  semanticLabel: 'شعار فرسان للخدمات',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
