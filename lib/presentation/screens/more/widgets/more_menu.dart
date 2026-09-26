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
      subtitle: 'عرض وتعديل معلومات حسابك الشخصي',
    ),
    MoreMenuItem(
      icon: Icons.receipt_long_outlined,
      title: 'الفواتير والمدفوعات',
      subtitle: 'كل المدفوعات والفواتير التي تمت عبر المنصة',
    ),
    MoreMenuItem(
      icon: Icons.shield_outlined,
      title: 'سياسة الخصوصية',
      subtitle: 'الاطلاع على سياسة الخصوصية الخاصة بالمنصة',
    ),
    MoreMenuItem(
      icon: Icons.gavel_outlined,
      title: 'الشروط والأحكام',
      subtitle: 'مراجعة الشروط والأحكام المعتمدة',
    ),
    MoreMenuItem(
      icon: Icons.gavel_outlined,
      title: 'إخلاء المسؤولية',
      subtitle: 'الاطلاع على بيان إخلاء المسؤولية',
    ),
    MoreMenuItem(
      icon: Icons.support_agent_outlined,
      title: 'الدعم الفني',
      subtitle: 'تواصل معنا للاستفسارات والدعم',
    ),
    MoreMenuItem(
      icon: Icons.chat_outlined,
      title: 'الأسئلة الشائعة',
      subtitle: 'إجابات سريعة على الأسئلة الأكثر شيوعاً',
    ),
    MoreMenuItem(
      icon: Icons.settings_outlined,
      title: 'الإعدادات',
      subtitle: 'إدارة إعدادات حسابك والتطبيق',
    ),
    MoreMenuItem(
      icon: Icons.logout_rounded,
      title: 'تسجيل الخروج',
      subtitle: 'تسجيل الخروج من حسابك الحالي',
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Builder(builder: (context) => _buildMenu(context)),
    ),
  );

  Widget _buildMenu(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppRadius.r25),
      border: Border.all(color: const Color(0xFFE8EDF1)),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(16, 24, 40, .06),
          blurRadius: 26,
          offset: Offset(0, 10),
        ),
      ],
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < _items.length; index++)
          MoreTile(
            item: _items[index],
            topPadding: index == 0 ? AppHeight.h16 : AppHeight.h10,
            bottomPadding: index == _items.length - 1
                ? AppHeight.h16
                : AppHeight.h10,
            onTap: index == 0
                ? () => const ShowProfileRoute().push(context)
                : index == 1
                ? () => const InvoicesAndPaymentsRoute().push(context)
                : index == 2
                ? () => const PrivacyPolicyRoute().push(context)
                : index == 3
                ? () => const TermsAndConditionsRoute().push(context)
                : index == 5
                ? () => const ContactUsRoute().push(context)
                : index == 6
                ? () => const FQRoute().push(context)
                : index == 7
                ? () => const SettingRoute().push(context)
                : index == _items.length - 1
                ? () => _showLogoutDialog(context)
                : null,
          ),
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
