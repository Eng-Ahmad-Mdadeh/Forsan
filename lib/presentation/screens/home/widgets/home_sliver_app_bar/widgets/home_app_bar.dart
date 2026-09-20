import 'package:flutter/material.dart';

/// The app bar used at the top of the home screen.
///
/// The very low-opacity black shadow produces the soft neutral-grey edge from
/// the design instead of inheriting a tinted shadow from the app theme.
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
