import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../widgets/onboarding_components.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => TextEditingController());
    _focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        body: SafeArea(
          child: ResponsiveScreenWidth(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenHorizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 1),
                  OnboardingBackTitle(
                    title: 'Verificar código',
                    onBack: () => _goBack(context),
                  ),
                  const SizedBox(height: 41),
                  Text(
                    'Escribe el código que enviamos por SMS a tu\ncelular.',
                    style: AppTextStyles.bodySmall,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: EdgeInsets.only(right: index == 3 ? 0 : 12),
                        child: _OtpCell(
                          index: index,
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          onChanged: (value) => _handleDigit(index, value),
                          onBackspace: () => _handleBackspace(index),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 28),
                  OnboardingPrimaryButton(
                    label: 'Verificar',
                    buttonKey: const Key('otp-verify'),
                    onPressed: () => context.goNamed('signup-eps'),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  OnboardingOutlineButton(
                    label: 'Reenviar código',
                    buttonKey: const Key('otp-resend'),
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Código reenviado')),
                        );
                    },
                  ),
                  const SizedBox(height: AppSpacing.screenPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleDigit(int index, String value) {
    if (value.isNotEmpty && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  void _handleBackspace(int index) {
    if (_controllers[index].text.isEmpty && index > 0) {
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed('signup');
    }
  }
}

class _OtpCell extends StatelessWidget {
  const _OtpCell({
    required this.index,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onBackspace,
  });

  final int index;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onBackspace;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace) {
          onBackspace();
        }
        return KeyEventResult.ignored;
      },
      child: SizedBox(
        width: 50,
        height: 52,
        child: TextField(
          key: Key('otp-digit-$index'),
          controller: controller,
          focusNode: focusNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          textInputAction: index == 3
              ? TextInputAction.done
              : TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: onChanged,
          style: AppTextStyles.screenTitle,
          decoration: onboardingInputDecoration(highlighted: index == 0),
        ),
      ),
    );
  }
}
