import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
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
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(18),
      child: Row(children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.person_rounded, size: 30),
        ),
        const SizedBox(width: 14),
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('حسابي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          Text('إدارة بيانات الحساب', style: TextStyle(color: Color(0xFF77727F))),
        ])),
        const Icon(Icons.chevron_left_rounded),
      ]),
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
