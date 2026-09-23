import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../widgets/onboarding_components.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _documentType;
  bool _acceptedTerms = true;

  late final TextEditingController _documentController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _documentController = TextEditingController(text: 'Cédula');
    _emailController = TextEditingController(text: 'tucorreo@correo.com');
    _phoneController = TextEditingController(text: '300 000 0000');
  }

  @override
  void dispose() {
    _documentController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenHorizontalPadding,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 1),
                        OnboardingBackTitle(
                          title: 'Crear cuenta',
                          onBack: () => _goBack(context),
                        ),
                        const SizedBox(height: 42),
                        const OnboardingFieldLabel('Tipo de documento'),
                        const SizedBox(height: AppSpacing.xs),
                        SizedBox(
                          height: 52,
                          child: DropdownButtonFormField<String>(
                            key: const Key('signup-document-type'),
                            initialValue: _documentType,
                            isExpanded: true,
                            hint: Text(
                              'Selecciona',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                            icon:
                                const Icon(Icons.keyboard_arrow_down, size: 18),
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.onSurface,
                            ),
                            decoration: onboardingInputDecoration(),
                            items: const [
                              DropdownMenuItem(
                                value: 'Cédula de ciudadanía',
                                child: Text('Cédula de ciudadanía'),
                              ),
                              DropdownMenuItem(
                                value: 'Cédula de extranjería',
                                child: Text('Cédula de extranjería'),
                              ),
                              DropdownMenuItem(
                                value: 'Pasaporte',
                                child: Text('Pasaporte'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() => _documentType = value);
                            },
                          ),
                        ),
                        const SizedBox(height: 27),
                        OnboardingTextField(
                          label: 'Documento',
                          controller: _documentController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          fieldKey: const Key('signup-document'),
                        ),
                        const SizedBox(height: 27),
                        OnboardingTextField(
                          label: 'Correo',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.email],
                          fieldKey: const Key('signup-email'),
                        ),
                        const SizedBox(height: 27),
                        OnboardingTextField(
                          label: 'Celular',
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.telephoneNumber],
                          fieldKey: const Key('signup-phone'),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                key: const Key('signup-terms'),
                                value: _acceptedTerms,
                                activeColor: AppColors.primary,
                                side:
                                    const BorderSide(color: AppColors.outline),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                onChanged: (value) {
                                  setState(
                                      () => _acceptedTerms = value ?? false);
                                },
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  'Al continuar aceptas los términos y la\npolítica de datos',
                                  style: AppTextStyles.caption.copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        OnboardingPrimaryButton(
                          label: 'Continuar',
                          buttonKey: const Key('signup-continue'),
                          onPressed: _acceptedTerms
                              ? () => context.goNamed('signup-verify-code')
                              : null,
                        ),
                        const SizedBox(height: AppSpacing.screenPadding),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed('welcome');
    }
  }
}
