import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:forsan/presentation/bloc/order_steps/order_steps_bloc.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/activity_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/applicant_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/documents_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/establishment_type_step.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_step_indicator.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/ownership_structure_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/proposed_company_info_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/review_step.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/failure_screen.dart';
import 'package:forsan/presentation/widgets/loading_widget.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class CreateNewOrderScreen extends StatelessWidget {
  final String serviceSlug;

  const CreateNewOrderScreen({super.key, required this.serviceSlug});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderStepsBloc>(create: (_) => OrderStepsBloc()),
        BlocProvider<CreateOrderBloc>(create: (_) => CreateOrderBloc()),
        BlocProvider<NewOrderCubit>(create: (_) => NewOrderCubit()),
      ],
      child: BodyCreateNewOrderScreen(serviceSlug: serviceSlug),
    );
  }
}

class BodyCreateNewOrderScreen extends StatefulWidget {
  final String serviceSlug;

  const BodyCreateNewOrderScreen({super.key, required this.serviceSlug});

  @override
  State<BodyCreateNewOrderScreen> createState() => _CreateNewOrderScreenState();
}

class _CreateNewOrderScreenState extends State<BodyCreateNewOrderScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _loadOrderSteps();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToStep(BuildContext context, int step) {
    context.read<NewOrderCubit>().changeStep(step);
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _loadOrderSteps() {
    context.read<OrderStepsBloc>().add(
      OrderStepsEvent(CreateOrderEntity(serviceSlug: widget.serviceSlug)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderStepsBloc, IOrderStepsState>(
      builder: (context, orderStepsState) {
        if (orderStepsState is OrderStepsFailed) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: _buildAppBar(context),
            body: FailureScreen(
              errorMessage: orderStepsState.message,
              onPressed: _loadOrderSteps,
            ),
          );
        }

        if (orderStepsState is! OrderStepsLoaded) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: _buildAppBar(context),
            body: const SafeArea(child: LoadingWidget(0)),
          );
        }

        final steps =
            orderStepsState.orderStepsModel?.data?.steps ?? const <StepModel>[];

        if (steps.isEmpty) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: _buildAppBar(context),
            body: FailureScreen(
              errorMessage:
                  orderStepsState.orderStepsModel?.message ??
                  context.loc.no_data_available,
              onPressed: _loadOrderSteps,
            ),
          );
        }

        final stepTitles = steps
            .map((step) => step.title?.trim() ?? '')
            .toList(growable: false);

        return BlocBuilder<NewOrderCubit, NewOrderState>(
          builder: (context, state) => Scaffold(
            backgroundColor: AppColors.white,
            appBar: _buildAppBar(context, state: state),
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppPaddingWidth.p20,
                      AppPaddingHeight.p18,
                      AppPaddingWidth.p20,
                      AppPaddingHeight.p14,
                    ),
                    child: OrderStepIndicator(
                      currentStep: state.orderEntity.currentStep,
                      stepTitles: stepTitles,
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      key: const Key('new_order_page_view'),
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: context.read<NewOrderCubit>().changeStep,
                      children: [
                        EstablishmentTypeStep(
                          step: steps[0],
                          selectedValues: state.orderEntity.formValues,
                          onFieldChanged: context.read<NewOrderCubit>().updateFormValue,
                        ),
                        ApplicantStep(
                          step: steps[1],
                          selectedValues: state.orderEntity.formValues,
                          onFieldChanged:
                              context.read<NewOrderCubit>().updateFormValue,
                        ),
                        ProposedCompanyInfoStep(
                          step: steps[2],
                          selectedValues: state.orderEntity.formValues,
                          onFieldChanged: context.read<NewOrderCubit>().updateFormValue,
                        ),
                        OwnershipStructureStep(
                          step: steps[3],
                          selectedValues: state.orderEntity.formValues,
                          onFieldChanged: context.read<NewOrderCubit>().updateFormValue,
                        ),
                        ActivityStep(
                          step: steps[4],
                          selectedValues: state.orderEntity.formValues,
                          onFieldChanged: context.read<NewOrderCubit>().updateFormValue,
                        ),
                        DocumentsStep(step: steps[5]),
                        ReviewStep(
                          step: steps[6],
                          establishmentStep: steps[0],
                          agreement: orderStepsState.orderStepsModel?.data?.agreements??[],
                          onEditStep: (step) => _goToStep(context, step),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppPaddingWidth.p16,
                      AppPaddingHeight.p8,
                      AppPaddingWidth.p16,
                      AppPaddingHeight.p16,
                    ),
                    child: CustomElevatedButton(
                      key: const Key('new_order_next_button'),
                      width: double.infinity,
                      height: AppHeight.h50,
                      color: AppColors.primary,
                      onPressed: () {
                        final currentStep = state.orderEntity.currentStep;

                        if (currentStep == 0) {
                          context.read<CreateOrderBloc>().add(
                            CreateOrderEvent(
                              CreateOrderEntity(
                                serviceSlug: widget.serviceSlug,
                                formValues: state.orderEntity.formValues,
                              ),
                            ),
                          );
                        }

                        if (currentStep < NewOrderCubit.lastStep) {
                          _goToStep(context, currentStep + 1);
                        }
                      },
                      child: BodyTitle(
                        text: state.orderEntity.currentStep ==
                                NewOrderCubit.lastStep
                            ? context.loc.new_order_submit
                            : context.loc.new_order_next,
                        color: AppColors.white,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context, {
    NewOrderState? state,
  }) {
    return CustomAppBar(
      title: context.loc.new_order_title,
      backgroundColor: AppColors.white,
      showBackButton: true,
      showScrolledUnderElevation: false,
      onTapBackButton: state == null || state.orderEntity.currentStep == 0
          ? () => Navigator.of(context).pop()
          : () => _goToStep(context, state.orderEntity.currentStep - 1),
      customActions: [
        HeaderIconButton(
          icon: Icons.close_rounded,
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
