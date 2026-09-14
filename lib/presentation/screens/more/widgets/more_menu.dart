import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/screens/more/widgets/more_menu_item.dart';
import 'package:forsan/presentation/screens/more/widgets/more_tile.dart';

class MoreMenu extends StatelessWidget {
  const MoreMenu({super.key});

  static const List<MoreMenuItem> _items = [
    MoreMenuItem(
      icon: Icons.person_outline_rounded,
      title: 'الملف الشخصي',
      subtitle: 'الملف الشخصي',
    ),
    MoreMenuItem(
      icon: Icons.receipt_long_outlined,
      title: 'الفواتير والمدفوعات',
    ),
    MoreMenuItem(icon: Icons.shield_outlined, title: 'سياسة الخصوصية'),
    MoreMenuItem(icon: Icons.gavel_outlined, title: 'الشروط والأحكام'),
    MoreMenuItem(icon: Icons.gavel_outlined, title: 'أخلاق المسؤولية'),
    MoreMenuItem(icon: Icons.support_agent_outlined, title: 'الدعم الفني'),
    MoreMenuItem(icon: Icons.chat_outlined, title: 'الأسئلة الشائعة'),
    MoreMenuItem(icon: Icons.settings_outlined, title: 'الإعدادات'),
    MoreMenuItem(
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
          MoreTile(
            item: _items[index],
            onTap: index == 0
                ? () => const ShowProfileRoute().push(context)
                : index == 7
                ? () => const SettingRoute().push(context)
                : index == 1
                ? () => const InvoicesAndPaymentsRoute().push(context)
                : null,
          ),
          if (index != _items.length - 1)
            Divider(
              height: 1,
              thickness: .7,
              color: AppColors.lightGrey.withOpacity(0.5),
            ),
        ],
      ],
    ),
  );
}
