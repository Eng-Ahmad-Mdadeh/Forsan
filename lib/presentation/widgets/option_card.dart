import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/routes/app_routes_imports.dart';
import 'package:forsan/presentation/widgets/custom_radio_tile.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.title,
    this.subtitle,
    this.isWalletOption = false,
    this.image,
    required this.onChanged,
    required this.option,
    required this.selectedOption,
  });

  final String title;
  final String? subtitle;
  final String option;
  final String selectedOption;
  final Function(String) onChanged;
  final String? image;
  final bool isWalletOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(AppRadius.r7),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomRadioTile(
              title: SectionTitle(text: title),
              supTitle: subtitle != null
                  ? isWalletOption
                        ? Row(
                            children: [
                              BodyTitle(
                                text: "الرصيد المتوفر: ",

                                fontSize: AppFontSize.s13,
                                color: AppColors.greyText,
                              ),
                              BodyTitle(
                                text: subtitle,
                                fontSize: AppFontSize.s13,
                                color: AppColors.greyText,
                              ),
                              SizedBox(
                                width: AppWidth.w5,
                              ),
                              ImageView(
                                imagePath: AppAssets.riyal,
                                width: AppWidth.w17,
                                height: AppHeight.h17,
                                color: AppColors.greyText,
                              ),
                            ],
                          )
                        : BodyTitle(
                            text: subtitle,
                            fontSize: AppFontSize.s13,
                            color: AppColors.greyText,
                          )
                  : null,
              option: option,
              selectedOption: selectedOption,
              onChanged: onChanged,
            ),
          ),
          if (image != null)
            Padding(
              padding: EdgeInsetsDirectional.only(end: AppPaddingWidth.p15),
              child: ImageView(
                imagePath: image!,
                width: AppWidth.w35,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
