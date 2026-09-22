import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../widgets/onboarding_components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _identityController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _identityController = TextEditingController();
    _passwordController = TextEditingController(text: '123456');
  }

  @override
  void dispose() {
    _identityController.dispose();
    _passwordController.dispose();
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text('Iniciar sesión', style: AppTextStyles.screenTitle),
                      const SizedBox(height: 203),
                      OnboardingTextField(
                        label: 'Documento o correo',
                        controller: _identityController,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [
                          AutofillHints.username,
                          AutofillHints.email,
                        ],
                        fieldKey: const Key('login-identity'),
                      ),
                      const SizedBox(height: 30),
                      OnboardingTextField(
                        label: 'Contraseña',
                        controller: _passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.password],
                        fieldKey: const Key('login-password'),
                      ),
                      const SizedBox(height: 32),
                      OnboardingPrimaryButton(
                        label: 'Entrar',
                        buttonKey: const Key('login-submit'),
                        onPressed: () => context.goNamed('home'),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      OnboardingOutlineButton(
                        label: 'Crear cuenta',
                        buttonKey: const Key('login-create-account'),
                        onPressed: () => context.goNamed('signup'),
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
    );
  }
}
