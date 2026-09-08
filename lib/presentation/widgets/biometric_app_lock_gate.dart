import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/biometric_lock/biometric_lock_cubit.dart';
import 'package:forsan/presentation/cubit/biometric_lock/biometric_lock_state.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class BiometricAppLockGate extends StatefulWidget {
  const BiometricAppLockGate({super.key, required this.child});

  final Widget child;

  @override
  State<BiometricAppLockGate> createState() => _BiometricAppLockGateState();
}

class _BiometricAppLockGateState extends State<BiometricAppLockGate> with WidgetsBindingObserver {
  late final BiometricLockCubit _biometricLockCubit;

  @override
  void initState() {
    super.initState();
    _biometricLockCubit = BiometricLockCubit();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _biometricLockCubit.unlockIfEnabled(reason: 'استخدم بصمة الإصبع لفتح التطبيق'),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _biometricLockCubit.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final biometricState = _biometricLockCubit.state;
    if (biometricState.isAuthenticating) {
      return;
    }

    if (state == AppLifecycleState.resumed && biometricState.isLocked) {
      _biometricLockCubit.unlock(reason: 'استخدم بصمة الإصبع لفتح تطبيق forsan');
      return;
    }

    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      _biometricLockCubit.lockIfEnabled();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _biometricLockCubit,
      child: BlocBuilder<BiometricLockCubit, BiometricLockState>(
        builder: (context, state) {
          return Stack(
            children: [
              widget.child,
              if (state.isLocked)
                Positioned.fill(
                  child: ColoredBox(
                    color: AppColors.backGround,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fingerprint, color: AppColors.primary, size: AppSize.s100),
                            SizedBox(height: AppHeight.h24),
                            SectionTitle(text: 'التطبيق مقفل', fontSize: AppFontSize.s20),
                            SizedBox(height: AppHeight.h8),
                            BodyTitle(
                              text: 'تحقق من هويتك باستخدام بصمة الإصبع للمتابعة إلى حسابك.',
                              color: AppColors.greyText,
                              fontSize: AppFontSize.s16,
                              fontWeight: AppFontWeight.regular,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            SizedBox(height: AppHeight.h32),
                            _FingerprintUnlockButton(
                              isAuthenticating: state.isAuthenticating,
                              onTap: () => context.read<BiometricLockCubit>().unlock(
                                reason: 'استخدم بصمة الإصبع لفتح تطبيق forsan',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _FingerprintUnlockButton extends StatelessWidget {
  const _FingerprintUnlockButton({required this.isAuthenticating, required this.onTap});

  final bool isAuthenticating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
     color: AppColors.none,
      child: Semantics(
        button: true,
        label: 'فتح بالبصمة',
        child: InkWell(
          onTap: isAuthenticating ? null : onTap,
          customBorder: const CircleBorder(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: AppHeight.h86,
            width: AppWidth.w86,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(isAuthenticating ? .10 : .16),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withOpacity(isAuthenticating ? .18 : .35),
                width: AppWidth.w1,
              ),
            ),
            child: isAuthenticating
                ? SizedBox(
                    height: AppSize.s38,
                    width: AppSize.s38,
                    child: const CircularProgressIndicator(strokeWidth: 2.4, color: AppColors.primary),
                  )
                : Icon(Icons.fingerprint, color: AppColors.primary, size: AppSize.s58),
          ),
        ),
      ),
    );
  }
}
