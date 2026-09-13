import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_avatar.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
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
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p1,
      ),
      children:  [
        _ProfileCard(),
        SizedBox(height: AppHeight.h20),
        _MoreMenu(),
        SizedBox(height: AppHeight.h150),

      ],
    ),
  );
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) => SizedBox(
    height: AppHeight.h150,
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
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddingWidth.p16,
          vertical: AppPaddingHeight.p10,
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
                        width: AppWidth.w6,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SectionTitle(
                      text: 'أحمد عيسى',
                      maxLines: 1,
                      color: AppColors.white,
                      fontSize: AppFontSize.s16,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppWidth.w70),
            Expanded(
              child: ImageView(
                imagePath: AppAssets.fullLogo,
                key: const Key('more-full-logo'),
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
                semanticLabel: 'شعار فرسان للخدمات',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _MoreMenu extends StatelessWidget {
  const _MoreMenu();

  static const List<_MoreMenuItem> _items = [
    _MoreMenuItem(
      icon: Icons.person_outline_rounded,
      title: 'الملف الشخصي',
      subtitle: 'الملف الشخصي',
    ),
    _MoreMenuItem(
      icon: Icons.receipt_long_outlined,
      title: 'الفواتير والمدفوعات',
    ),
    _MoreMenuItem(
      icon: Icons.shield_outlined,
      title: 'سياسة الخصوصية',
    ),
    _MoreMenuItem(
      icon: Icons.gavel_outlined,
      title: 'الشروط والأحكام',
    ),
    _MoreMenuItem(
      icon: Icons.gavel_outlined,
      title: 'أخلاق المسؤولية',
    ),
    _MoreMenuItem(
      icon: Icons.support_agent_outlined,
      title: 'الدعم الفني',
    ),
    _MoreMenuItem(
      icon: Icons.chat_outlined,
      title: 'الأسئلة الشائعة',
    ),
    _MoreMenuItem(icon: Icons.settings_outlined, title: 'الإعدادات'),
    _MoreMenuItem(
      icon: Icons.logout_rounded,
      title: 'تسجيل الخروج',
      isDestructive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.zero,
    elevation: 1,
    shadowColor: AppColors.black.withValues(alpha: .1),
    color: AppColors.white,
    surfaceTintColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.r8),
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < _items.length; index++) ...[
          _MoreTile(item: _items[index]),
          if (index != _items.length - 1)
             Divider(height: 1, thickness: .7, color: AppColors.lightGrey.withOpacity(0.5)),
        ],
      ],
    ),
  );
}

class _MoreMenuItem {
  const _MoreMenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isDestructive;
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({required this.item});

  final _MoreMenuItem item;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = item.isDestructive
        ? const Color(0xFFFF3158)
        : AppColors.mainText;
    final iconBackgroundColor = item.isDestructive
        ? const Color(0xFFFFF4F6)
        : AppColors.goldBackGround;
    final iconColor = item.isDestructive
        ? const Color(0xFFFF3158)
        : AppColors.secondaryNormal;

    return ListTile(
      minTileHeight: item.subtitle == null ? 45 : 45,
      contentPadding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p5),
      leading: Container(
        width: AppWidth.w45,
        height: AppWidth.w45,
        margin:EdgeInsetsDirectional.only(start: AppPaddingWidth.p5),
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        alignment: Alignment.center,
        child: Icon(item.icon, color: iconColor, size: AppSize.s24),
      ),
      title: Text(
        item.title,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: foregroundColor,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.bold,
        ),
      ),
      subtitle: item.subtitle == null
          ? null
          : Text(
              item.subtitle!,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.regular,
              ),
            ),
      trailing: Icon(
        item.isDestructive
            ? Icons.arrow_forward_rounded
            : Icons.chevron_right_rounded,
        color: foregroundColor,
        size: AppSize.s24,
      ),
      onTap: () {},
    );
  }
}
