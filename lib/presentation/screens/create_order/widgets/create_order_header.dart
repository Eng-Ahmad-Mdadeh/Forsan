import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/image_view.dart';

class CreateOrderHeader extends StatelessWidget {
  const CreateOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPaddingHeight.p16),
      child: Semantics(
        image: true,
        label: context.loc.new_order_title,
        child: ImageView(
          imagePath: AppAssets.newOrder,
          key: const Key('create_order_image'),
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
