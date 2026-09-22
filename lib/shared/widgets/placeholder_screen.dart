import 'package:flutter/material.dart';

// Pantalla de relleno para rutas sin implementación real todavía.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.frameNumber,
    required this.frameName,
    required this.frameNodeId,
    this.checkpoint,
  });

  final String frameNumber;
  final String frameName;
  final String frameNodeId;
  final String? checkpoint;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: canPop,
        title: Text('$frameNumber — $frameName'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.construction_outlined,
                size: 40,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: 16),
              Text(
                frameName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Nodo Figma $frameNodeId'
                '${checkpoint != null ? ' · pendiente en $checkpoint' : ''}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
