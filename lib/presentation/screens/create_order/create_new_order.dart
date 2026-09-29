import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/presentation/bloc/complete_order/complete_order_bloc.dart';
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
import 'package:forsan/presentation/widgets/custom_snack_bar.dart';
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
        BlocProvider<CompleteOrderBloc>(create: (_) => CompleteOrderBloc()),
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
  final List<GlobalKey<FormState>> _stepFormKeys = List.generate(
    6,
    (_) => GlobalKey<FormState>(),
  );
  bool _draftRequested = false;

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
      OrderStepsEvent(CreateOrderEntity(slug: widget.serviceSlug)),
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

        if (!_draftRequested) {
          _draftRequested = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            context.read<CreateOrderBloc>().add(
              CreateOrderEvent(
                CreateOrderEntity(serviceSlug: widget.serviceSlug),
              ),
            );
          });
        }

        return MultiBlocListener(
          listeners: [
            BlocListener<CreateOrderBloc, ICreateOrderState>(
              listener: (context, createOrderState) {
                if (createOrderState is CreateOrderLoading) {
                  _showLoadingDialog(context);
                } else if (createOrderState is CreateOrderFailed) {
                  _handleRequestFailure(context, createOrderState.message);
                } else if (createOrderState is CreateOrderLoaded) {
                  final draft = createOrderState.createOrderModel?.data;
                  Navigator.of(context, rootNavigator: true).pop();
                  if (draft != null) {
                    context.read<NewOrderCubit>().initializeDraft(draft);
                    final page = ((draft.currentStep ?? 1) - 1).clamp(
                      0,
                      NewOrderCubit.lastStep,
                    );
                    _pageController.jumpToPage(page);
                  }
                }
              },
            ),
            BlocListener<CompleteOrderBloc, ICompleteOrderState>(
              listener: (context, completeOrderState) {
                if (completeOrderState is CompleteOrderLoading) {
                  _showLoadingDialog(context);
                } else if (completeOrderState is CompleteOrderFailed) {
                  _handleRequestFailure(context, completeOrderState.message);
                } else if (completeOrderState is CompleteOrderLoaded) {
                  Navigator.of(context, rootNavigator: true).pop();
                  final savedStep = completeOrderState
                      .completeOrderModel
                      ?.data
                      ?.currentStep;
                  final currentPage = context
                      .read<NewOrderCubit>()
                      .state
                      .orderEntity
                      .currentStep;
                  final nextPage = (savedStep ?? currentPage + 2) - 1;
                  _goToStep(
                    context,
                    nextPage.clamp(0, NewOrderCubit.lastStep),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<NewOrderCubit, NewOrderState>(
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
                            formKey: _stepFormKeys[0],
                            step: steps[0],
                            selectedValues: state.orderEntity.formValues,
                            onFieldChanged: context
                                .read<NewOrderCubit>()
                                .updateFormValue,
                          ),
                          ApplicantStep(
                            formKey: _stepFormKeys[1],
                            step: steps[1],
                            selectedValues: state.orderEntity.formValues,
                            onFieldChanged: context
                                .read<NewOrderCubit>()
                                .updateFormValue,
                          ),
                          ProposedCompanyInfoStep(
                            formKey: _stepFormKeys[2],
                            step: steps[2],
                            selectedValues: state.orderEntity.formValues,
                            onFieldChanged: context
                                .read<NewOrderCubit>()
                                .updateFormValue,
                          ),
                          OwnershipStructureStep(
                            formKey: _stepFormKeys[3],
                            step: steps[3],
                            selectedValues: state.orderEntity.formValues,
                            onFieldChanged: context
                                .read<NewOrderCubit>()
                                .updateFormValue,
                          ),
                          ActivityStep(
                            formKey: _stepFormKeys[4],
                            step: steps[4],
                            selectedValues: state.orderEntity.formValues,
                            onFieldChanged: context
                                .read<NewOrderCubit>()
                                .updateFormValue,

                          ),
                          DocumentsStep(
                            formKey: _stepFormKeys[5],
                            step: steps[5],
                          ),
                          ReviewStep(
                            step: steps[6],
                            establishmentStep: steps[0],
                            agreement:
                                orderStepsState
                                    .orderStepsModel
                                    ?.data
                                    ?.agreements ??
                                [],
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

                          if (currentStep < _stepFormKeys.length &&
                              !(_stepFormKeys[currentStep].currentState
                                      ?.validate() ??
                                  false)) {
                            showCustomSnackBar(
                              context: context,
                              title: context.loc.error,
                              message:
                                  context.loc.complete_profile_required_field,
                              contentType: ContentType.failure,
                            );
                            return;
                          }

                          context.read<CompleteOrderBloc>().add(
                            CompleteOrderEvent(
                              state.orderEntity.copyWith(
                                currentStep: (currentStep + 1).clamp(
                                  0,
                                  NewOrderCubit.lastStep,
                                ),
                              ),
                            ),
                          );
                        },
                        child: BodyTitle(
                          text:
                              state.orderEntity.currentStep ==
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
          ),
        );
      },
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const PopScope(
        canPop: false,
        child: LoadingWidget(0),
      ),
    );
  }

  void _handleRequestFailure(BuildContext context, String message) {
    Navigator.of(context, rootNavigator: true).pop();
    showCustomSnackBar(
      context: context,
      title: context.loc.error,
      message: message,
      contentType: ContentType.failure,
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
