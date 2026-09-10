import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/routes/app_routes_imports.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';

class StatusPill extends StatelessWidget {
  final String? status;

  const StatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final normalized = status!.toLowerCase().trim();

    final statusStyle = _StatusStyle.fromStatus(normalized,context);

    return Pill(
      label: statusStyle.label,
      background: statusStyle.background,
      foreground: statusStyle.foreground,
      icon: statusStyle.icon,
    );
  }
}

class Pill extends StatelessWidget {
  final String label;
  final Color background;
  final Color foreground;
  final IconData? icon;

  const Pill({
    super.key,
    required this.label,
    required this.background,
    required this.foreground,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p8,
        vertical: AppPaddingHeight.p4,
      ),
      decoration: ShapeDecoration(
        color: background,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: AppSize.s14, color: foreground),
            const SizedBox(width: 3),
          ],
          BodyTitle(
            text: label,
            color: foreground,
            fontSize: AppFontSize.s14,
          ),
        ],
      ),
    );
  }
}

class _StatusStyle {
  final String label;
  final Color background;
  final Color foreground;
  final IconData icon;

  const _StatusStyle({
    required this.label,
    required this.background,
    required this.foreground,
    required this.icon,
  });

  static _StatusStyle fromStatus(String status,BuildContext context) {
    switch (status) {
      case 'active':
      case 'published':
      case 'available':
        return  _StatusStyle(
          label: context.loc.ad_card_status_active,
          background: const Color(0xFFE6F6EB),
          foreground: const Color(0xFF1A9E4A),
          icon: Icons.check_circle_outline,
        );
      case 'accepted':
        return  _StatusStyle(
          label: context.loc.ad_card_status_accepted,
          background: const Color(0xFFE6F6EB),
          foreground: const Color(0xFF1A9E4A),
          icon: Icons.check_circle_outline,
        );
      case 'paused':
      case 'inactive':
      case 'pending':
      case 'draft':

        return  _StatusStyle(
          label: context.loc.ad_card_status_pending,
          background: const Color(0xFFFFF1E0),
          foreground: const Color(0xFFEF6C00),
          icon: Icons.pause_circle_outline,
        );
      case 'unsold':
        return  _StatusStyle(
          label: context.loc.ad_card_status_unsold,
          background: AppColors.red,
          foreground: AppColors.white,
          icon: Icons.pause_circle_outline,
        );
      case 'sold':
      case 'completed':
        return  _StatusStyle(
          label: context.loc.ad_card_status_sold,
          background: const Color(0xFFE3F2FD),
          foreground: const Color(0xFF1976D2),
          icon: Icons.check_circle_outline,
        );
      case 'rejected':
        return  _StatusStyle(
          label: context.loc.ad_card_status_rejected,
          background: AppColors.lightRed,
          foreground: AppColors.red,
          icon: Iconsax.close_circle_outline,
        );
      case 'withdrawn':
        return  _StatusStyle(
          label: context.loc.ad_card_status_withdrawn,
          background: AppColors.searchColor,
          foreground: AppColors.greyText,
          icon: Icons.info_outline,
        );
      default:
        return _StatusStyle(
          label: status,
          background: AppColors.searchColor,
          foreground: AppColors.greyText,
          icon: Icons.info_outline,
        );
    }
  }
}
