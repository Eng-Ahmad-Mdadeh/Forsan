import 'package:flutter/material.dart';

import '../../../core/resources/app_assets.dart';
import 'widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const HomeHeader(),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
      children: [
        Semantics(
          image: true,
          label: 'الصورة الرئيسية',
          child: Image.asset(
            AppAssets.appBanner,
            key: const Key('home-main-image'),
            width: double.infinity,
            fit: BoxFit.fitWidth,
            excludeFromSemantics: true,
          ),
        ),
      ],
    ),
  );
}
