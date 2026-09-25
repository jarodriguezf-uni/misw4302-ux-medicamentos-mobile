import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';

class OnboardingBackTitle extends StatelessWidget {
  const OnboardingBackTitle({
    required this.title,
    required this.onBack,
    super.key,
  });

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 32,
          child: IconButton(
            key: const Key('back-button'),
            onPressed: onBack,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.arrow_back, size: 20),
            tooltip: 'Regresar',
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(title, style: AppTextStyles.screenTitle),
          ),
        ),
      ],
    );
  }
}

class OnboardingFieldLabel extends StatelessWidget {
  const OnboardingFieldLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppTextStyles.caption.copyWith(fontSize: 11));
  }
}

class OnboardingTextField extends StatelessWidget {
  const OnboardingTextField({
    required this.label,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.fieldKey,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OnboardingFieldLabel(label),
        const SizedBox(height: AppSpacing.xs),
        SizedBox(
          height: 52,
          child: TextField(
            key: fieldKey,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            autofillHints: autofillHints,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.onSurface),
            decoration: onboardingInputDecoration(hintText: hintText),
          ),
        ),
      ],
    );
  }
}

InputDecoration onboardingInputDecoration({
  String? hintText,
  bool highlighted = false,
}) {
  const border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide.none,
  );

  return InputDecoration(
    hintText: hintText,
    hintStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted),
    filled: true,
    fillColor: AppColors.fieldBackground,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    border: border,
    enabledBorder: highlighted
        ? border.copyWith(
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          )
        : border,
    focusedBorder: border.copyWith(
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
  );
}

class OnboardingPrimaryButton extends StatelessWidget {
  const OnboardingPrimaryButton({
    required this.label,
    required this.onPressed,
    this.buttonKey,
    this.compact = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final Key? buttonKey;

  /// Padding horizontal reducido (usado cuando el botón comparte fila con
  /// otro, p. ej. "Sacar turno aquí" / "Llamar al punto"), donde el padding
  /// por defecto de Material 3 (24 px por lado) no deja espacio para el
  /// texto en una sola línea.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSpacing.buttonHeight,
      child: FilledButton(
        key: buttonKey,
        onPressed: onPressed,
        style: compact
            ? FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
              )
            : null,
        child: compact
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(label, textAlign: TextAlign.center),
              )
            : Text(label, textAlign: TextAlign.center),
      ),
    );
  }
}

class OnboardingOutlineButton extends StatelessWidget {
  const OnboardingOutlineButton({
    required this.label,
    required this.onPressed,
    this.buttonKey,
    this.compact = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final Key? buttonKey;

  /// Ver la nota de [OnboardingPrimaryButton.compact].
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSpacing.buttonHeight,
      child: OutlinedButton(
        key: buttonKey,
        onPressed: onPressed,
        style: compact
            ? OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
              )
            : null,
        child: compact
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(label, textAlign: TextAlign.center),
              )
            : Text(label, textAlign: TextAlign.center),
      ),
    );
  }
}
