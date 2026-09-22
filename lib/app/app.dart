import 'package:flutter/material.dart';

import 'router.dart';
import 'theme/theme.dart';

class MedicamentosApp extends StatelessWidget {
  const MedicamentosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Medicamentos EPS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: appRouter,
    );
  }
}
