import 'package:flutter/material.dart';

import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_values.dart';
import 'widgets/home_header.dart';
import 'widgets/required_documents_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const HomeHeader(),
    body: ListView(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p16,
        AppPaddingHeight.p20,
        AppPaddingWidth.p16,
        AppPaddingHeight.p24,
      ),
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
        SizedBox(height: AppHeight.h16),
        const RequiredDocumentsCard(),
      ],
    ),
  );
}
