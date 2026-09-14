import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/routes/app_routes_imports.dart';

class CustomSwitch extends StatelessWidget {
  final String title;
  final String? subTitle;
  final FontWeight? titleWeight;
  final double? titleSize;
  final bool req;
  final Widget? child;
  final Color? titleColor;
  final Function(bool) onChanged;
  final bool initialValue;

  const CustomSwitch({
    super.key,
    required this.title,
    this.subTitle,
    required this.onChanged,
    this.titleSize,
    this.titleWeight,
    this.req = false,
    this.child,
    this.titleColor,
    this.initialValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationSwitchCubit(initialValue: initialValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppWidth.w20,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      overflow: TextOverflow.visible,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: titleColor ?? AppColors.secondary,
                              fontSize: titleSize ?? AppFontSize.s16,
                              fontWeight: titleWeight,
                            ),
                          ),
                          if (req)
                            TextSpan(
                              text: ' *',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppColors.red,
                                fontSize: AppFontSize.s18,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (subTitle != null)
                      BodyTitle(
                        text: subTitle,
                        fontWeight: AppFontWeight.regular,
                        color: AppColors.greyText,
                        fontSize: AppFontSize.s12,
                      ),
                  ],
                ),
              ),
              BlocBuilder<ReservationSwitchCubit, bool>(
                builder: (context, state) {
                  return _SwitchControl(
                    value: state,
                    onChanged: (value) {
                      context.read<ReservationSwitchCubit>().switchChanged(value);
                      onChanged.call(value);
                    },
                  );
                },
              ),
            ],
          ),
          BlocBuilder<ReservationSwitchCubit, bool>(
            builder: (context, state) {
              return state && child != null ? child!.animate().fadeIn() : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

class _SwitchControl extends StatelessWidget {
  static const _animationDuration = Duration(milliseconds: 200);
  static const _activeColor = Color(0xFF34C759);
  static const _inactiveColor = Color(0xFFC7C7CC);
  static const _inactiveIndicatorColor = Color(0xFFB3B3B7);

  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchControl({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final width = 66.w;
    final height = 29.h;
    final inset = 2.w;
    final thumbWidth = 42.w;

    return Semantics(
      toggled: value,
      button: true,
      onTap: () => onChanged(!value),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onChanged(!value),
        child: AnimatedContainer(
          duration: _animationDuration,
          curve: Curves.easeInOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: value ? _activeColor : _inactiveColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                right: 12.w,
                child: AnimatedOpacity(
                  duration: _animationDuration,
                  opacity: value ? 1 : 0,
                  child: Container(
                    width: 1.5.w,
                    height: 10.h,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 8.w,
                child: AnimatedOpacity(
                  duration: _animationDuration,
                  opacity: value ? 0 : 1,
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _inactiveIndicatorColor,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: _animationDuration,
                curve: Curves.easeInOut,
                left: value ? inset : width - thumbWidth - inset,
                top: 2.h,
                child: Container(
                  width: thumbWidth,
                  height: height - 4.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(height / 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationSwitchCubit extends Cubit<bool> {
  ReservationSwitchCubit({required bool initialValue}) : super(initialValue);

  void switchChanged(bool v) => emit(v);
}
