import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/payment_methods/western_union/widgets/western_union_form.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

import '../../../../core/routes/app_routes_imports.dart';

class WesternUnionScreen extends StatelessWidget {
  const WesternUnionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: context.loc.pay_western_union,
        showBackButton: true,
        backgroundColor: AppColors.white,
        showScrolledUnderElevation: false,
        toolbarHeight: AppHeight.h70,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.fromSTEB(
          AppPaddingWidth.p10,
          AppPaddingHeight.p8,
          AppPaddingWidth.p10,
          AppPaddingHeight.p24,
        ),
        child: const WesternUnionForm(),
      ),
    );
  }
}
