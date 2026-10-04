import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/bloc/get_profile/get_profile_bloc.dart';
import 'package:forsan/presentation/screens/show_profile/widgets/profile_info_card.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_avatar.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/failure_screen.dart';
import 'package:forsan/presentation/widgets/loading_widget.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class ShowProfileScreen extends StatelessWidget {
  const ShowProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProfileBloc>(create: (_) => GetProfileBloc()),
      ],
      child: BodyShowProfileScreen(),
    );
  }
}

class BodyShowProfileScreen extends StatefulWidget {
  const BodyShowProfileScreen({super.key});

  @override
  State<BodyShowProfileScreen> createState() => _BodyShowProfileScreenState();
}

class _BodyShowProfileScreenState extends State<BodyShowProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الملف الشخصي',
        showBackButton: true,
        backgroundColor: AppColors.white,
        showScrolledUnderElevation: false,
        toolbarHeight: AppHeight.h70,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p8,
            AppPaddingWidth.p16,
            AppPaddingHeight.p16,
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<GetProfileBloc, IGetProfileState>(
                  builder: (context, state) {
                    if (state is GetProfileFailed) {
                      return FailureScreen(
                        errorMessage: state.message,
                        onPressed: () => context
                            .read<GetProfileBloc>()
                            .add(GetProfileEvent()),
                      );
                    }
                    if (state is GetProfileLoading) {
                      return const Center(child: LoadingWidget(0));
                    }
                    if (state is GetProfileLoaded) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: AppWidth.w100,
                              height: AppHeight.h100,
                              child: CustomAvatar(
                                name: state.profileModel?.data?.fullName ?? '',
                                backgroundColor: AppColors
                                    .profileAvatarBackground,
                                foregroundColor: AppColors
                                    .profileAvatarForeground,
                                icon: Icons.person_outline_rounded,
                                iconSize: AppSize.s58,
                              ),
                            ),
                            SizedBox(height: AppHeight.h8),
                            SectionTitle(
                              text: 'أحمد عيسى',
                              color: AppColors.mainText,
                              fontSize: AppFontSize.s16,
                              fontWeight: AppFontWeight.bold,
                            ),
                            SizedBox(height: AppHeight.h20),
                            ProfileInfoCard(profile: state.profileModel?.data),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              CustomSubmitButton(
                key: const Key('show-profile-edit-button'),
                text: 'تعديل ',
                icon: Icons.edit,
                useGradient: false,
                onPressed: () => const EditProfileRoute().push(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
