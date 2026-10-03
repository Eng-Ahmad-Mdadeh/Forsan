import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
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
import 'package:forsan/presentation/screens/create_order/steps_widgets/activity_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/applicant_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/documents_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/establishment_type_step.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_step_indicator.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/ownership_structure_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/proposed_company_info_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/review_step.dart';
import 'package:forsan/presentation/widgets/app_status_dialog.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/custom_snack_bar.dart';
import 'package:forsan/presentation/widgets/failure_screen.dart';
import 'package:forsan/presentation/widgets/loading_widget.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:icons_plus/icons_plus.dart';

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
    _createOrLoadDraft();
  }

  void _createOrLoadDraft() {
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
      listener: _onCreateOrderStateChanged,
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

          final steps =
              orderStepsState.orderStepsModel?.data?.steps ??
              const <StepModel>[];

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
                    final savedStep =
                        completeOrderState.completeOrderModel?.data?.currentStep;
                    final currentPage = context
                        .read<NewOrderCubit>()
                        .state
                        .orderEntity
                        .currentStep;
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
                            onPageChanged: context
                                .read<NewOrderCubit>()
                                .changeStep,
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
                                selectedValues: state.orderEntity.formValues,
                                onFieldChanged: context
                                    .read<NewOrderCubit>()
                                    .updateFormValue,
                              ),
                              ReviewStep(
                                step: steps[6],
                                formSteps: steps.take(6).toList(growable: false),
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
                          child: Row(
                            children: [
                              if (state.orderEntity.currentStep > 0) ...[
                                Expanded(
                                  child: CustomElevatedButton(
                                    key: const Key(
                                      'new_order_previous_button',
                                    ),
                                    height: AppHeight.h50,
                                    color: AppColors.lightActive,

                                    onPressed: () => _goToStep(
                                      context,
                                      state.orderEntity.currentStep - 1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                         Icon(
                                          Icons.arrow_back_rounded,
                                          size: AppSize.s18,
                                          color: AppColors.white,
                                        ),
                                        SizedBox(width: AppWidth.w4),
                                        BodyTitle(
                                          text: context.loc.new_order_previous,
                                          color: AppColors.white,
                                          fontWeight: AppFontWeight.semiBold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: AppPaddingWidth.p12),
                              ],
                              Expanded(
                                child: CustomElevatedButton(
                                  key: const Key('new_order_next_button'),
                                  height: AppHeight.h50,
                                  color: AppColors.primary,
                                  onPressed: () {
                                    final orderEntity = context
                                        .read<NewOrderCubit>()
                                        .state
                                        .orderEntity;
                                    final currentStep = orderEntity.currentStep;
                                    // if (currentStep < _stepFormKeys.length &&
                                    //     !(_stepFormKeys[currentStep]
                                    //             .currentState
                                    //             ?.validate() ??
                                    //         false)) {
                                    //   showCustomSnackBar(
                                    //     context: context,
                                    //     title: context.loc.error,
                                    //     message: context
                                    //         .loc
                                    //         .complete_profile_required_field,
                                    //     contentType: ContentType.failure,
                                    //   );
                                    //   return;
                                    // }

                                    if (currentStep < NewOrderCubit.lastStep) {
                                      _goToStep(context, currentStep + 1);
                                      return;
                                    }
                                    if(currentStep==NewOrderCubit.lastStep){
                                      context.read<SubmitOrderBloc>().add(
                                        SubmitOrderEvent(orderEntity),
                                      );
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BodyTitle(
                                        text:
                                            state.orderEntity.currentStep ==
                                                NewOrderCubit.lastStep
                                            ? context.loc.new_order_submit
                                            : context.loc.new_order_next,
                                        color: AppColors.white,
                                        fontWeight: AppFontWeight.semiBold,
                                      ),
                                      SizedBox(width: AppWidth.w4),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        size: AppSize.s18,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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

  void _onCreateOrderStateChanged(
    BuildContext context,
    ICreateOrderState createOrderState,
  ) {

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

  PreferredSizeWidget _buildAppBar(
    BuildContext context, {
    NewOrderState? state,
  }) {
    return CustomAppBar(
      title: context.loc.new_order_title,
      backgroundColor: AppColors.white,
      //showBackButton: true,
      showScrolledUnderElevation: false,
      // onTapBackButton: state == null || state.orderEntity.currentStep == 0
      //     ? () => Navigator.of(context).pop()
      //     : () => _goToStep(context, state.orderEntity.currentStep - 1),
      customActions: [
        HeaderIconButton(
          icon: Icons.close_rounded,
          onTap: () {
            _showLogoutDialog(context);
          },
        ),
      ],
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) {
    return AppStatusDialog.show(
      context,
      title: 'هل تود الخروج ؟',
      message: 'يمكنك حفظ الطلب كمسودة ومتابعته لاحقا',
      primaryButtonText: 'حفظ كمسودة',
      secondaryButtonText: 'إغلاق الطلب ',
      secondaryButtonIcon: Icons.close,
      primaryButtonIcon: Icons.edit_document,
      icon: Icons.logout_rounded,
      iconColor: AppColors.white,
      iconBackgroundColor: AppColors.primary,
      iconBorderColor: AppColors.secondary,
      iconOuterBackgroundColor: const Color(0xFFE4DEF2),
      secondaryButtonColor: AppColors.red,
      titleColor: AppColors.black,
      messageColor: AppColors.greyText,
      messageFontSize: AppFontSize.s14,
      messageFontWeight: AppFontWeight.regular,
      messageMaxLines: 2,
      buttonsDirection: Axis.horizontal,
      showCloseButton: true,
      canDismiss: true,
      onSecondaryPressed: (){
        context.pop();
         SelectServiceTypeRoute().go(context);

      },
      onPrimaryPressed: () {
        final orderEntity = context
            .read<NewOrderCubit>()
            .state
            .orderEntity;
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
      },
    );
  }

  Future<void> _showSubmitDialog(
    BuildContext context, {
    String? orderNumber,
  }) {
    return AppStatusDialog.show(
      context,
      title: 'تم استلام طلبك بنجاح',
      message: 'سيقوم فريق فرسان بمراجعة المعلومات والمستندات والتواصل معك في حال وجود نواقص أو متطلبات إضافية، ثم سيتم تزويدك بالمسار والتكلفة النهائية.',
      primaryButtonText: 'متابعة الطلب',
      orderNumber: orderNumber,
      icon: Icons.logout_rounded,
      iconColor: AppColors.white,
      iconBackgroundColor: AppColors.primary,
      iconBorderColor: AppColors.secondary,
      iconOuterBackgroundColor: const Color(0xFFE4DEF2),
      secondaryButtonColor: AppColors.red,
      titleColor: AppColors.black,
      messageColor: AppColors.greyText,
      messageFontSize: AppFontSize.s14,
      messageFontWeight: AppFontWeight.regular,
      messageMaxLines: 2,
      buttonsDirection: Axis.horizontal,
      showCloseButton: true,
      canDismiss: true,

      onPrimaryPressed: () => context.pop(),
    );
  }

  void _dismissLoadingAndShowSubmitDialog(String? submittedReference) {
    Navigator.of(context, rootNavigator: true).pop();

    // Open the success dialog on the next frame. Pushing it while the loading
    // dialog is still being removed can cause the subsequent pop to remove the
    // success dialog instead.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final reference = submittedReference?.trim();
      final orderId = context.read<NewOrderCubit>().state.orderEntity.orderId;
      _showSubmitDialog(
        context,
        orderNumber: reference?.isNotEmpty == true ? reference : orderId,
      );
    });
  }
}
