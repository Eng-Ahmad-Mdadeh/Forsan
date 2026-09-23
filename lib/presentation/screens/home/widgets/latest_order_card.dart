import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:forsan/core/extension/date_time_extension.dart';
import 'package:forsan/data/models/home/home_model.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';

class LatestOrderCard extends StatelessWidget {
  final HomeModel homeModel;
  const LatestOrderCard({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Semantics(
      container: true,
      label: 'تفاصيل الطلب، نسبة الإنجاز ',
      child: Container(
        height: AppHeight.h160,
        padding: EdgeInsetsDirectional.only(
          start: AppPaddingWidth.p13,
          end: AppPaddingWidth.p16,
          top: AppPaddingHeight.p15,

        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r16),
          boxShadow: [
            BoxShadow(
              color: AppColors.homeSoftShadow.withOpacity(0.05),
              blurRadius: AppRadius.r10,
              offset: Offset(0, AppHeight.h4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _OrderDetails(homeModel)),
            SizedBox(width: AppWidth.w12),
            _OrderProgressAndAction(homeModel),
          ],
        ),
      ),
    ),
  );
}

class _OrderDetails extends StatelessWidget {
  final HomeModel homeModel;
  const _OrderDetails(this.homeModel);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppWidth.w16,
            height: AppHeight.h16,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.secondaryLightActive,
              shape: BoxShape.circle,
            ),
            child: Container(
              width: AppWidth.w10,
              height: AppHeight.h10,
              decoration: const BoxDecoration(
                color: AppColors.secondaryNormal,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: AppWidth.w6),
          BodyTitle(
            text: homeModel.currentRequest?.statusLabel??'',
            color: AppColors.secondary,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.medium,
          ),
        ],
      ),
      SizedBox(height: AppHeight.h7),
      SectionTitle(
        text: homeModel.currentRequest?.serviceName??'',
        color: AppColors.primaryDark,
        fontSize: AppFontSize.s14,
        fontWeight: AppFontWeight.bold,
        maxLines: 1,
      ),
      SizedBox(height: AppHeight.h4),
      BodyTitle(
        text:homeModel.currentRequest?.reference??'',
        color: AppColors.secondaryText,
        fontSize: AppFontSize.s12,
        fontWeight: AppFontWeight.medium,
      ),
      SizedBox(height: AppHeight.h4),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: AppSize.s16,
            color: AppColors.secondaryText,
          ),
          SizedBox(width: AppWidth.w2),
          BodyTitle(
            text:
            homeModel.currentRequest?.createdAt
                ?.formatWithPattern('dd/MM/yyyy') ??
                '',
            color: AppColors.primaryDark,
            fontSize: AppFontSize.s11,
            fontWeight: AppFontWeight.medium,
          ),
        ],
      ),
      SizedBox(height: AppHeight.h25),
      Row(
        children: [
          Icon(
            Icons.person_outline_rounded,
            size: AppSize.s18,
            color: AppColors.secondaryText,
          ),
          SizedBox(width: AppWidth.w2),
          BodyTitle(
            text: homeModel.currentRequest?.consultant?.fullName ?? '',
            color: AppColors.primaryDark,
            fontSize: AppFontSize.s11,
            fontWeight: AppFontWeight.medium,
            maxLines: 1,
          ),
        ],
      ),
    ],
  );
}

class _OrderProgressAndAction extends StatelessWidget {
  const _OrderProgressAndAction(this.homeModel);

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: AppWidth.w90,
    child: Column(
      children: [
        SizedBox(
          width: AppWidth.w90,
          height: AppHeight.h90,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox.expand(
                child: Transform.rotate(
                  angle: math.pi,
                  child: CircularProgressIndicator(
                    value: .5,
                    strokeWidth: AppWidth.w7,
                    strokeCap: StrokeCap.round,
                    backgroundColor: AppColors.lightActive,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SectionTitle(
                    text: '${homeModel.currentRequest?.progress ?? 0}%',
                    color: AppColors.mainText,
                    fontSize: AppFontSize.s24,
                    fontWeight: AppFontWeight.bold,
                  ),
                  BodyTitle(
                    text: 'نسبة الإنجاز',
                    color: AppColors.blackCow,
                    fontSize: AppFontSize.s11,
                    fontWeight: AppFontWeight.regular,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppHeight.h16),
        Semantics(
          button: true,
          label: 'عرض تفاصيل الطلب',
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(AppRadius.r8),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BodyTitle(
                    text: 'تفاصيل الطلب',
                    color: AppColors.primaryDark,
                    fontSize: AppFontSize.s11,
                    fontWeight: AppFontWeight.bold,
                  ),

                  Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.primaryDark,
                    size: AppSize.s16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
