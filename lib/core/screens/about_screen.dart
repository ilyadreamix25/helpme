import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helpme/constants.dart';
import 'package:helpme/core/widgets/scaffold.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> with SingleTickerProviderStateMixin {
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

    return HelpMeScaffold(
      appBarBackgroundColor: Colors.transparent,
      addNavigationButton: true,
      backgroundColor: theme.colorScheme.primary,
      extendBodyBehindAppBar: true,
      body: ClipRect(
        child: Stack(
          children: [
            _topLeftSpinningCircle(),
            _slogan(),
            _bottomRightSpinningCircle(),
            _versionInfo(),
          ],
        ),
      ),
    );
  }

  Widget _topLeftSpinningCircle() {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    
    return Align(
      alignment: Alignment.topLeft,
      child: Transform.translate(
        offset: Offset(-(mediaQuery.size.width / 2), -(mediaQuery.size.width / 2)),
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
    );
  }

  Widget _bottomRightSpinningCircle() {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Align(
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
    );
  }
  
  Widget _slogan() {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(56),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              locale.appName,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              locale.slogan,
              style: theme.textTheme.bodySmall!.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _versionInfo() {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final locale = AppLocalizations.of(context)!;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 56,
          right: 56,
          bottom: 56 + mediaQuery.viewPadding.bottom,
        ),
        child: Text(
          locale.version(appVersion, appVersionCode),
          style: theme.textTheme.bodySmall!.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
