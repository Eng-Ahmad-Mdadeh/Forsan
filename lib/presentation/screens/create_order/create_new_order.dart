import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/core/routes/app_routes_imports.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/presentation/bloc/complete_order/complete_order_bloc.dart';
import 'package:forsan/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:forsan/presentation/bloc/order_steps/order_steps_bloc.dart';
import 'package:forsan/presentation/bloc/submit_order/submit_order_bloc.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_dialogs.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_navigation_bar.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_steps_view.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_step_indicator.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_snack_bar.dart';
import 'package:forsan/presentation/widgets/failure_screen.dart';
import 'package:forsan/presentation/widgets/loading_widget.dart';

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
        BlocProvider<SubmitOrderBloc>(create: (_) => SubmitOrderBloc()),
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
  bool _draftPageApplied = false;

  @override
  void initState() {
    super.initState();
    context.read<CreateOrderBloc>().add(
      CreateOrderEvent(CreateOrderEntity(serviceSlug: widget.serviceSlug)),
    );
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
    return BlocListener<CreateOrderBloc, ICreateOrderState>(
      listener: (context, createOrderState) {
        if (createOrderState is CreateOrderFailed) {
          showCustomSnackBar(
            context: context,
            title: context.loc.error,
            message: createOrderState.message,
            contentType: ContentType.failure,
          );
        } else if (createOrderState is CreateOrderLoaded) {
          final draft = createOrderState.createOrderModel?.data;
          //Navigator.of(context, rootNavigator: true).pop();
          if (draft != null) {
            context.read<NewOrderCubit>().initializeDraft(draft);
            _loadOrderSteps();
          }
        }
      },
      child: BlocBuilder<OrderStepsBloc, IOrderStepsState>(
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

          final steps = orderStepsState.orderStepsModel?.data?.steps ?? const <StepModel>[];
          final stepTitles = steps.map((step) => step.title?.trim() ?? '').toList(growable: false);

          return MultiBlocListener(
            listeners: [
              BlocListener<CompleteOrderBloc, ICompleteOrderState>(
                listener: (context, completeOrderState) {
                  if (completeOrderState is CompleteOrderLoading) {
                    _showLoadingDialog(context);
                  } else if (completeOrderState is CompleteOrderFailed) {
                    _handleRequestFailure(context, completeOrderState.message);
                  } else if (completeOrderState is CompleteOrderLoaded) {
                    Navigator.of(context, rootNavigator: true).pop();
                    final savedStep = completeOrderState.completeOrderModel?.data?.currentStep;
                    final currentPage = context.read<NewOrderCubit>().state.orderEntity.currentStep;
                    final nextPage = savedStep ?? currentPage + 1;
                    _goToStep(
                      context,
                      nextPage.clamp(0, NewOrderCubit.lastStep),
                    );
                  }
                },
              ),
              BlocListener<SubmitOrderBloc, ISubmitOrderState>(
                listener: (context, submitOrderState) {
                  if (submitOrderState is SubmitOrderLoading) {
                    _showLoadingDialog(context);
                  } else if (submitOrderState is SubmitOrderFailed) {
                    _handleRequestFailure(context, submitOrderState.message);
                  } else if (submitOrderState is SubmitOrderLoaded) {
                    _dismissLoadingAndShowSubmitDialog(
                      //submitOrderState.submitOrderModel?.data?.reference,
                      '55555',
                    );
                  }
                },
              ),
            ],
            child: BlocBuilder<NewOrderCubit, NewOrderState>(
              builder: (context, state) {
                if (state.orderEntity.orderId == null) {
                  return Scaffold(
                    backgroundColor: AppColors.white,
                    appBar: _buildAppBar(context),
                    body: const SafeArea(child: LoadingWidget(0)),
                  );
                }

                if (!_draftPageApplied) {
                  _draftPageApplied = true;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted || !_pageController.hasClients) return;
                    _pageController.jumpToPage(state.orderEntity.currentStep);
                  });
                }

                return Scaffold(
                  backgroundColor: AppColors.white,
                  appBar: _buildAppBar(context),
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
                          child: CreateOrderStepsView(
                            controller: _pageController,
                            formKeys: _stepFormKeys,
                            steps: steps,
                            selectedValues: state.orderEntity.formValues,
                            agreements: orderStepsState.orderStepsModel?.data?.agreements ?? const <AgreementModel>[],
                            onFieldChanged: context.read<NewOrderCubit>().updateFormValue,
                            onPageChanged: context.read<NewOrderCubit>().changeStep,
                            onEditStep: (step) => _goToStep(context, step),
                          ),
                        ),
                        CreateOrderNavigationBar(
                          currentStep: state.orderEntity.currentStep,
                          lastStep: NewOrderCubit.lastStep,
                          onPrevious: () => _goToStep(context, state.orderEntity.currentStep - 1),
                          onNext: () => _handleNextStep(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _handleNextStep(BuildContext context) {
    final orderEntity = context.read<NewOrderCubit>().state.orderEntity;
    final currentStep = orderEntity.currentStep;

    if (currentStep < NewOrderCubit.lastStep) {
      _goToStep(context, currentStep + 1);
      return;
    }
    context.read<SubmitOrderBloc>().add(SubmitOrderEvent(orderEntity));
  }


  void _showLoadingDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const PopScope(canPop: false, child: LoadingWidget(0)),
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.loc.new_order_title,
      backgroundColor: AppColors.white,
      showScrolledUnderElevation: false,
      customActions: [
        HeaderIconButton(
          icon: Icons.close_rounded,
          onTap: () => CreateOrderDialogs.showExitConfirmation(
            context,
            onSaveDraft: () => _saveDraft(context),
            onCloseOrder: () => _closeOrder(context),
          ),
        ),
      ],
    );
  }

  void _closeOrder(BuildContext context) {
    context.pop();
    SelectServiceTypeRoute().go(context);
  }

  void _saveDraft(BuildContext context) {
    final orderEntity = context.read<NewOrderCubit>().state.orderEntity;
    final currentStep = orderEntity.currentStep;
    if (currentStep < _stepFormKeys.length &&
        !(_stepFormKeys[currentStep].currentState?.validate() ?? false)) {
      showCustomSnackBar(
        context: context,
        title: context.loc.error,
        message: context.loc.complete_profile_required_field,
        contentType: ContentType.failure,
      );
      return;
    }

    context.read<CompleteOrderBloc>().add(CompleteOrderEvent(orderEntity));
    context.pop();
  }

  void _dismissLoadingAndShowSubmitDialog(String? submittedReference) {
    Navigator.of(context, rootNavigator: true).pop();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final reference = submittedReference?.trim();
      final orderId = context.read<NewOrderCubit>().state.orderEntity.orderId;
      CreateOrderDialogs.showSubmissionSuccess(
        context,
        orderNumber: reference?.isNotEmpty == true ? reference : orderId,
      );
    });
  }
}
