import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';
import 'package:helpme/signin/data/signin_bloc.dart';
import 'package:helpme/signin/data/signin_event.dart';
import 'package:helpme/signin/data/signin_state.dart';
import 'package:helpme/signin/data/signin_status.dart';
import 'package:provider/provider.dart';

class SignInSubmitButton extends StatelessWidget {
  const SignInSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);
    final useApple = Provider.of<bool>(context);

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewPadding.bottom + 16),
        child: Align(
          alignment: Alignment.bottomRight,
          child: AnimatedOpacity(
            opacity: !state.status.buttonHidden && state.isPinCodeFinished
              ? 1.0
              : 0.0,
            duration: const Duration(milliseconds: 200),
            child: ScaleOnPress(
              onPressScale: 0.95,
              child: FilledButton(
                onPressed: () {
                  if (state.status is! SignInLoadingStatus) {
                    context.read<SignInBloc>().add(
                      SignInSubmit(useApple)
                    );
                  }
                },
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.status is SignInLoadingStatus
                      ? const SizedBox(
                        key: ValueKey<int>(0),
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                      : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            useApple
                              ? 'assets/images/apple_logo.svg'
                              : 'assets/images/google_logo.svg',
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(locale.finish),
                        ],
                      ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
