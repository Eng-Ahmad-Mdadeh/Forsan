import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/body_title.dart';

class HomeStatisticsSection extends StatelessWidget {
  const HomeStatisticsSection({super.key});

  static const List<_StatisticItem> _items = [
    _StatisticItem(
      title: 'الطلبات النشطة',
      value: '01',
      icon: Icons.account_tree_outlined,
    ),
    _StatisticItem(
      title: 'إجراءات مطلوبة',
      value: '01',
      icon: Icons.format_list_bulleted_rounded,
    ),
    _StatisticItem(
      title: 'إجمالي المدفوع',
      value: '2,522 ر.س',
      icon: Icons.payments_outlined,
    ),
    _StatisticItem(
      title: 'المبالغ المستحقة',
      value: '2,522 ر.س',
      icon: Icons.payments_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - AppWidth.w12) / 2;

        return Wrap(
          spacing: AppWidth.w12,
          runSpacing: AppHeight.h12,
          children: _items
              .map(
                (item) => SizedBox(
                  width: cardWidth,
                  height: AppHeight.h112,
                  child: _StatisticCard(item: item),
                ),
              )
              .toList(),
        );
      },
    ),
  );
}

class _StatisticCard extends StatelessWidget {
  const _StatisticCard({required this.item});

  final _StatisticItem item;

  @override
  Widget build(BuildContext context) => Semantics(
    container: true,
    label: '${item.title}: ${item.value}',
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.r20),
        boxShadow: [
          BoxShadow(
            color: AppColors.homeSoftShadow,
            blurRadius: AppRadius.r10,
            offset: Offset(0, AppHeight.h4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r20),
        child: Stack(
          children: [
            PositionedDirectional(
              top: -AppHeight.h42,
              start: -AppWidth.w38,
              child: Container(
                width: AppWidth.w90,
                height: AppHeight.h90,
                decoration: const BoxDecoration(
                  color: AppColors.lightGreySec,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppPaddingWidth.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: BodyTitle(
                          text: item.title,
                          color: AppColors.mainText,
                          fontSize: AppFontSize.s14,
                          fontWeight: AppFontWeight.regular,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(width: AppWidth.w8),
                      Container(
                        width: AppWidth.w40,
                        height: AppHeight.h40,
                        decoration: BoxDecoration(
                          color: AppColors.light,
                          borderRadius: BorderRadius.circular(AppRadius.r12),
                        ),
                        child: Icon(
                          item.icon,
                          color: AppColors.primary,
                          size: AppSize.s24,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  BodyTitle(
                    text: item.value,
                    color: AppColors.mainText,
                    fontSize: AppFontSize.s22,
                    fontWeight: AppFontWeight.bold,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _StatisticItem {
  const _StatisticItem({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;
}
