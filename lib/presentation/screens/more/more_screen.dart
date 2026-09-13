import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_avatar.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: CustomAppBar(
      title: 'المزيد',
      backgroundColor: AppColors.white,
      toolbarHeight: AppHeight.h70,
      showScrolledUnderElevation: false,
      titleSpacing: AppPaddingWidth.p16,
      titleWidget: SectionTitle(
        text: 'المزيد',
        color: AppColors.mainText,
        fontSize: AppFontSize.s18,
        fontWeight: AppFontWeight.bold,
      ),
      customActions: [
        HeaderIconButton(
          icon: Iconsax.notification_outline,
          onTap: () {},
        ),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        _ProfileCard(),
        SizedBox(height: 20),
        _MoreTile(icon: Icons.person_outline_rounded, title: 'الملف الشخصي'),
        _MoreTile(icon: Icons.settings_outlined, title: 'الإعدادات'),
        _MoreTile(icon: Icons.help_outline_rounded, title: 'المساعدة والدعم'),
        _MoreTile(icon: Icons.info_outline_rounded, title: 'عن التطبيق'),
      ],
    ),
  );
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 2.4,
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.profileBannerStart,
            AppColors.profileBannerEnd,
          ],
        ),
        borderRadius: BorderRadius.circular(AppRadius.r18),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {


          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPaddingWidth.p12,
              vertical: AppPaddingHeight.p12,
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  width: AppWidth.w100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppWidth.w100,
                        height: AppHeight.h100,
                        child: CustomAvatar(
                          name: 'أحمد عيسى',
                          backgroundColor: AppColors.profileAvatarBackground,
                          foregroundColor: AppColors.profileAvatarForeground,
                          icon: Icons.person_outline_rounded,
                          iconSize: AppSize.s58,
                          border: Border.all(
                            color: AppColors.white,
                            width: AppWidth.w4,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'أحمد عيسى',
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppFontSize.s16,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: constraints.maxWidth * .055),
                Expanded(
                  child: Semantics(
                    image: true,
                    label: 'شعار فرسان للخدمات',
                    child: Image.asset(
                      AppAssets.fullLogo,
                      key: const Key('more-full-logo'),
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.chevron_left_rounded),
      onTap: () {},
    ),
  );
}
