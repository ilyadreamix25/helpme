import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInSpinningCircle extends StatefulWidget {
  const SignInSpinningCircle({super.key});

  @override
  State<StatefulWidget> createState() => _SignInSpinningCircleState();
}

class _SignInSpinningCircleState extends State<SignInSpinningCircle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return ClipRect(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Transform.translate(
          offset: Offset(mediaQuery.size.width / 2, mediaQuery.size.width / 2),
          child: Transform.scale(
            scale: 1.15,
            child: RotationTransition(
              turns: _animationController,
              child: SvgPicture.asset('assets/images/scalloped_circle.svg',
                width: mediaQuery.size.width,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.primaryContainer,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
