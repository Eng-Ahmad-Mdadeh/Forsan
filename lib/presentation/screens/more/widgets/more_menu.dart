import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/bloc/auth/logout/logout_bloc.dart';
import 'package:forsan/presentation/screens/more/widgets/more_menu_item.dart';
import 'package:forsan/presentation/screens/more/widgets/more_tile.dart';
import 'package:forsan/presentation/widgets/app_status_dialog.dart';

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
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => LogoutBloc(),
    child: BlocListener<LogoutBloc, ILogoutState>(
      listener: (context, state) {
        if (state is LogoutLoaded) {
          const LoginRoute().go(context);
        } else if (state is LogoutFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Builder(builder: (context) => _buildMenu(context)),
    ),
  );

  Widget _buildMenu(BuildContext context) => Card(
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
                : index == 2
                ? () => const PrivacyPolicyRoute().push(context)
                : index == _items.length - 1
                ? () => _showLogoutDialog(context)
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

  Future<void> _showLogoutDialog(BuildContext context) {
    return AppStatusDialog.show(
      context,
      title: '',
      message: context.loc.logout_confirmation,
      primaryButtonText: context.loc.confirm,
      secondaryButtonText: context.loc.cancel,
      icon: Icons.logout_rounded,
      iconColor: AppColors.white,
      iconBackgroundColor: AppColors.primary,
      iconBorderColor: AppColors.secondary,
      iconOuterBackgroundColor: const Color(0xFFE4DEF2),
      secondaryButtonColor: AppColors.red,
      messageColor: AppColors.primary,
      messageFontSize: AppFontSize.s20,
      messageFontWeight: AppFontWeight.bold,
      messageMaxLines: 2,
      buttonsDirection: Axis.horizontal,
      showCloseButton: true,
      canDismiss: true,
      onPrimaryPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        context.read<LogoutBloc>().add(const LogoutEvent());
      },
    );
  }
}
