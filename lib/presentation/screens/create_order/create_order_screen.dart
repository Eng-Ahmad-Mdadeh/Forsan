import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

import '../../widgets/image_view.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'طلب جديد',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showBackButton: true,
        titleWidget: SectionTitle(
          text: 'طلب جديد',
          color: AppColors.mainText,
          fontSize: AppFontSize.s20,
          fontWeight: AppFontWeight.bold,
        ),
        customActions: [
          Semantics(
            button: true,
            label: 'الإشعارات',
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(AppRadius.r8),
              child: Container(
                width: AppWidth.w40,
                height: AppHeight.h40,
                decoration: BoxDecoration(
                  color: AppColors.backGround,
                  border: Border.all(color: AppColors.greyDivider),
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.lightBlack,
                  size: AppSize.s24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p20,
            AppPaddingWidth.p16,
            AppPaddingHeight.p24,
          ),
          children: [
            Semantics(
              image: true,
              label: 'طلب جديد',
              child: ImageView(
                imagePath: AppAssets.newOrder,
                key: const Key('home-main-image'),
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
