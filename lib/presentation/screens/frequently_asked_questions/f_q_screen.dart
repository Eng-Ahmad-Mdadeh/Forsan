import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class FQScreen extends StatefulWidget {
  const FQScreen({super.key});

  @override
  State<FQScreen> createState() => _FQScreenState();
}

class _FQScreenState extends State<FQScreen> {
  static const List<_FrequentlyAskedQuestion> _questions = [
    _FrequentlyAskedQuestion(
      question: 'ما الفرق بين شراء عقار كامل والتملك الجزئي ؟',
      answer:
          'شراء العقار بالكامل يتطلب رأس مال أكبر ويتحمل المالك كامل مسؤولية الممتلك. أما التملك الجزئي فيتيح امتلاك حصة من عقار بمبلغ أصغر، مع الاستفادة من العوائد وفق نسبة الملكية دون الحاجة لشراء العقار كاملاً.',
    ),
    _FrequentlyAskedQuestion(
      question: 'هل احتاج الى خبرة عقارية للبدء ؟',
      answer:
          'لا، لا تحتاج إلى خبرة عقارية مسبقة. نعرض لك معلومات العقار وتفاصيل الفرصة بوضوح لتتمكن من اتخاذ قرارك بسهولة.',
    ),
    _FrequentlyAskedQuestion(
      question: 'هل يمكن امتلاك أكثر من جزء ؟',
      answer:
          'نعم، يمكنك امتلاك أكثر من جزء في العقار نفسه أو توزيع استثمارك على عدة عقارات متاحة.',
    ),
    _FrequentlyAskedQuestion(
      question: 'هل الملكية موثقة ؟',
      answer:
          'نعم، يتم توثيق الملكية وحصة كل مالك وفق الإجراءات والأنظمة المعتمدة.',
    ),
  ];

  int? _expandedQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الأسئلة الشائعة',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showScrolledUnderElevation: false,
        showBackButton: true,
        titleSpacing: AppPaddingWidth.p8,
        titleWidget: SectionTitle(
          text: 'الأسئلة الشائعة',
          color: AppColors.mainText,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.bold,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p8,
            AppPaddingHeight.p4,
            AppPaddingWidth.p8,
            AppPaddingHeight.p24,
          ),
          itemCount: _questions.length,
          separatorBuilder: (_, _) => SizedBox(height: AppMarginHeight.m8),
          itemBuilder: (context, index) {
            return _QuestionCard(
              question: _questions[index],
              isExpanded: _expandedQuestion == index,
              onTap: () {
                setState(() {
                  _expandedQuestion = _expandedQuestion == index ? null : index;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.question,
    required this.isExpanded,
    required this.onTap,
  });

  final _FrequentlyAskedQuestion question;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: AppColors.white,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPaddingWidth.p10,
                vertical: AppPaddingHeight.p10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 27,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(width: AppMarginWidth.m10),
                      Expanded(
                        child: Text(
                          question.question,
                          style: TextStyle(
                            color: AppColors.mainText,
                            fontFamily: AppFontFamily.tajawal,
                            fontSize: AppFontSize.s14,
                            fontWeight: AppFontWeight.medium,
                            height: 1.45,
                          ),
                        ),
                      ),
                      SizedBox(width: AppMarginWidth.m8),
                      AnimatedRotation(
                        turns: isExpanded ? -.25 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(
                          Icons.chevron_left_rounded,
                          color: AppColors.mainText,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  AnimatedCrossFade(
                    firstChild: const SizedBox(width: double.infinity),
                    secondChild: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: AppPaddingWidth.p24,
                        end: AppPaddingWidth.p24,
                        top: AppPaddingHeight.p13,
                        bottom: AppPaddingHeight.p8,
                      ),
                      child: Text(
                        question.answer,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.blackCow,
                          fontFamily: AppFontFamily.tajawal,
                          fontSize: AppFontSize.s13,
                          fontWeight: AppFontWeight.regular,
                          height: 1.9,
                        ),
                      ),
                    ),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 200),
                    sizeCurve: Curves.easeInOut,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FrequentlyAskedQuestion {
  const _FrequentlyAskedQuestion({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;
}
