import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/service_type/service_type_model.dart';
import 'package:forsan/presentation/bloc/create_order/service_type/service_type_bloc.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_app_bar.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_header.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_help_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_services_grid.dart';
import 'package:forsan/presentation/widgets/failure_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectServiceTypeScreen extends StatelessWidget {
  const SelectServiceTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceTypeBloc(),
      child: const _SelectServiceTypeBody(),
    );
  }
}

class _SelectServiceTypeBody extends StatefulWidget {
  const _SelectServiceTypeBody();

  @override
  State<_SelectServiceTypeBody> createState() =>
      _SelectServiceTypeBodyState();
}

class _SelectServiceTypeBodyState extends State<_SelectServiceTypeBody> {
  static final _loadingServiceTypes = List.generate(
    6,
    (index) => ServiceTypeModel(
      id: '$index',
      slug: '',
      name: 'اسم الخدمة',
      description: '',
      iconUrl: null,
      comingSoon: false,
    ),
  );

  @override
  void initState() {
    context.read<ServiceTypeBloc>().add(const ServiceTypeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceTypeBloc, IServiceTypeState>(
      builder: (context, state) {
        if (state is ServiceTypeFailed) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: const CreateOrderAppBar(),
            body: FailureScreen(
              errorMessage: state.message,
              onPressed: () => context.read<ServiceTypeBloc>().add(
                const ServiceTypeEvent(),
              ),
            ),
          );
        }

        final serviceTypes = state is ServiceTypeLoaded
            ? state.serviceTypeModel?.data ?? const <ServiceTypeModel>[]
            : _loadingServiceTypes;

        return Skeletonizer(
          enableSwitchAnimation: true,
          enabled:
              state is ServiceTypeInitial || state is ServiceTypeLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: const CreateOrderAppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  AppPaddingWidth.p16,
                  AppPaddingHeight.p16,
                  AppPaddingWidth.p16,
                  AppPaddingHeight.p24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CreateOrderHeader(),
                    CreateOrderServicesGrid(serviceTypes: serviceTypes),
                    const CreateOrderHelpCard(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
