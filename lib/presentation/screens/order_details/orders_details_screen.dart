import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:forsan/domain/entities/order_details/order_details_entity.dart';
import 'package:forsan/presentation/bloc/order_details/order_details_bloc.dart';
import 'package:forsan/presentation/screens/order_details/widgets/order_details_header_card.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/extension/localization_extension.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../../core/routes/app_routes.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/failure_screen.dart';
import '../../widgets/required_action_card.dart';
import '../../widgets/text/body_title.dart';
import '../../widgets/text/section_title.dart';
import '../orders/models/order_item.dart';
import 'widgets/order_attached_documents_card.dart';
import 'widgets/order_documents_card.dart';
import 'widgets/order_stages_card.dart';
import 'widgets/order_summary_card.dart';

class OrdersDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrdersDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderDetailsBloc>(create: (context) => OrderDetailsBloc()),
      ],
      child: BodyOrdersDetailsScreen(orderId: orderId),
    );
  }
}

class BodyOrdersDetailsScreen extends StatefulWidget {
  final String orderId;
  const BodyOrdersDetailsScreen({super.key, required this.orderId});

  @override
  State<BodyOrdersDetailsScreen> createState() => _BodyOrdersDetailsScreenState();
}

class _BodyOrdersDetailsScreenState extends State<BodyOrdersDetailsScreen> {
  static const OrderItem _skeletonOrder = OrderItem(
    id: '0',
    title: 'تأسيس شركة جديدة',
    number: 'FR-2026-000000',
    date: '23/09/2026',
    consultant: 'اسم المستشار',
    status: 'قيد المراجعة',
  );

  @override
  void initState() {
    super.initState();
    _loadOrderDetails();
  }

  void _loadOrderDetails() => context.read<OrderDetailsBloc>().add(
    OrderDetailsEvent(OrderDetailsEntity(requestId: widget.orderId)),
  );

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OrderDetailsBloc, IOrderDetailsState>(
        builder: (context, state) {
          if (state is OrderDetailsFailed) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: _buildAppBar(),
              body: FailureScreen(
                errorMessage: state.message,
                onPressed: _loadOrderDetails,
              ),
            );
          }

          final isLoading =
              state is OrderDetailsInitial || state is OrderDetailsLoading;
          final details = state is OrderDetailsLoaded
              ? state.orderDetailsModel?.data
              : null;
          final order = details == null ? _skeletonOrder : _toOrderItem(details);

          return Skeletonizer(
            enableSwitchAnimation: true,
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              duration: const Duration(milliseconds: 500),
            ),
            enabled: isLoading,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: _buildAppBar(),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    AppPaddingWidth.p16,
                    AppPaddingHeight.p16,
                    AppPaddingWidth.p16,
                    AppPaddingHeight.p20,
                  ),
                  child: Column(
                    children: [
                      OrderDetailsHeaderCard(order: order),
                      SizedBox(height: AppHeight.h16),
                      RequiredActionCard(
                        title: context.loc.order_required_action,
                        message: context.loc.order_required_documents_message,
                        buttonText: context.loc.order_complete_requirements,
                        semanticsLabel: context.loc.order_required_action,
                        onPressed: () =>
                            const CompleteRequirementsRoute().push(context),
                      ),
                      SizedBox(height: AppHeight.h16),
                      OrderSummaryCard(
                        order: order,
                        submittedBy: context.loc.order_submitter_abroad,
                        service: context.loc.order_business_establishment,
                        fees: context.loc.order_fees_after_review,
                      ),
                      SizedBox(height: AppHeight.h16),
                      const OrderStagesCard(),
                      SizedBox(height: AppHeight.h16),
                      const OrderDocumentsCard(),
                      SizedBox(height: AppHeight.h16),
                      const OrderAttachedDocumentsCard(),
                      SizedBox(height: AppHeight.h20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              height: AppHeight.h52,
                              color: AppColors.homeSupportAction,
                              borderRadius: AppRadius.r12,
                              onPressed: () {
                                const PayRoute().push(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: AppColors.white,
                                    size: AppSize.s15,
                                  ),
                                  SizedBox(width: AppWidth.w5),
                                  BodyTitle(
                                    text: context.loc.order_approve_and_pay,
                                    color: AppColors.white,
                                    fontSize: AppFontSize.s12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: AppWidth.w7),
                          Expanded(
                            child: CustomElevatedButton(
                              height: AppHeight.h52,
                              color: AppColors.primary,
                              borderRadius: AppRadius.r12,
                              onPressed: () {},
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPaddingWidth.p14,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    FluentIcons.chat_multiple_24_filled,
                                    color: AppColors.white,
                                    size: AppSize.s15,
                                  ),
                                  SizedBox(width: AppWidth.w5),
                                  Flexible(
                                    child: BodyTitle(
                                      text: context.loc.order_contact_consultant,
                                      color: AppColors.white,
                                      fontSize: AppFontSize.s12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  CustomAppBar _buildAppBar() => CustomAppBar(
    title: context.loc.order_details,
    backgroundColor: AppColors.white,
    toolbarHeight: AppHeight.h70,
    showBackButton: true,
    titleWidget: SectionTitle(
      text: context.loc.order_details,
      color: AppColors.mainText,
      fontSize: AppFontSize.s18,
      fontWeight: AppFontWeight.bold,
    ),
  );

  OrderItem _toOrderItem(OrderDetailsModel details) => OrderItem(
    id: details.id ?? widget.orderId,
    title: details.serviceName ?? '',
    number: details.reference ?? '',
    date: details.createdAt == null
        ? ''
        : DateFormat('dd/MM/yyyy').format(details.createdAt!.toLocal()),
    consultant: _consultantName(details.consultant),
    status: details.statusLabel ?? details.displayStatus ?? '',
  );

  String _consultantName(dynamic consultant) {
    if (consultant is Map<String, dynamic>) {
      return consultant['fullName']?.toString() ?? '';
    }
    return consultant?.toString() ?? '';
  }
}
