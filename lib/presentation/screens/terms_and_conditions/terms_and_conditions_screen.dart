import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/domain/entities/legal_page/legal_page_entity.dart';
import 'package:forsan/presentation/bloc/legal_page/legal_page_bloc.dart';
import 'package:forsan/presentation/screens/terms_and_conditions/widgets/terms_and_conditions_card.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/failure_screen.dart';
import 'package:forsan/presentation/widgets/loading_widget.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LegalPageBloc>(
          create: (_) => LegalPageBloc()
            ..add(const LegalPageEvent(LegalPageEntity(page: 'terms'))),
        ),
      ],
      child: const BodyTermsAndConditionsScreen(),
    );
  }
}


class BodyTermsAndConditionsScreen extends StatelessWidget {
  const BodyTermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الشروط والأحكام',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showScrolledUnderElevation: false,
        showBackButton:true,
        titleSpacing: AppPaddingWidth.p8,
        titleWidget: SectionTitle(
          text: 'الشروط والأحكام',
          color: AppColors.mainText,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.bold,
        ),
      ),
      body:BlocBuilder<LegalPageBloc, ILegalPageState>(
        builder: (context, state) {
          if (state is LegalPageFailed) {
            return FailureScreen(
              errorMessage: state.message,
              onPressed: () => context.read<LegalPageBloc>().add(
                LegalPageEvent(LegalPageEntity(page: 'terms')),
              ),
            );
          }
          if (state is LegalPageLoading) {
            return const Center(child: LoadingWidget(0));
          }
          if (state is LegalPageLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: AppPaddingWidth.p16,
                vertical: AppPaddingHeight.p16,
              ),
              itemCount: state.legalPageModel?.data?.sections?.length ?? 0,
              itemBuilder: (context, index) {
                final section = state.legalPageModel!.data!.sections![index];
                return Padding(
                  padding: EdgeInsets.only(bottom: AppPaddingHeight.p12),
                  child: TermsAndConditionsCard(
                    key: ValueKey(section.number ?? index),
                    section: section,
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
