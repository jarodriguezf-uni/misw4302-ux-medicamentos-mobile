import 'package:go_router/go_router.dart';

import '../shared/widgets/placeholder_screen.dart';

// Rutas de las 31 pantallas del inventario móvil. En M1 apuntan a
// PlaceholderScreen; cada checkpoint reemplaza su tramo. `name` coincide con
// codeRouteName en docs/design/design-manifest.json.
final appRouter = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '01',
        frameName: 'Bienvenida',
        frameNodeId: '8:1355',
        checkpoint: 'M2',
      ),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '02',
        frameName: 'Iniciar sesión',
        frameNodeId: '8:1369',
        checkpoint: 'M2',
      ),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '03',
        frameName: 'Crear cuenta',
        frameNodeId: '8:1384',
        checkpoint: 'M2',
      ),
      routes: [
        GoRoute(
          path: 'verify-code',
          name: 'signup-verify-code',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '04',
            frameName: 'Verificar código',
            frameNodeId: '8:1409',
            checkpoint: 'M2',
          ),
        ),
        GoRoute(
          path: 'eps',
          name: 'signup-eps',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '05',
            frameName: 'Elegir EPS',
            frameNodeId: '8:1426',
            checkpoint: 'M3',
          ),
          routes: [
            GoRoute(
              path: 'validating',
              name: 'signup-eps-validating',
              builder: (context, state) => const PlaceholderScreen(
                frameNumber: '06',
                frameName: 'Validando afiliación',
                frameNodeId: '8:1445',
                checkpoint: 'M3',
              ),
            ),
            GoRoute(
              path: 'status',
              name: 'signup-eps-status',
              builder: (context, state) => const PlaceholderScreen(
                frameNumber: '07',
                frameName: 'Estado de la afiliación',
                frameNodeId: '8:1456',
                checkpoint: 'M3',
              ),
            ),
            GoRoute(
              path: 'confirm/sanitas',
              name: 'signup-eps-confirm-sanitas',
              builder: (context, state) => const PlaceholderScreen(
                frameNumber: '12.1',
                frameName: 'Confirma tus datos (Sanitas)',
                frameNodeId: '8:1630',
                checkpoint: 'M3',
              ),
            ),
            GoRoute(
              path: 'confirm/compensar',
              name: 'signup-eps-confirm-compensar',
              builder: (context, state) => const PlaceholderScreen(
                frameNumber: '12.2',
                frameName: 'Confirma tus datos (Compensar)',
                frameNodeId: '8:1648',
                checkpoint: 'M3',
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '08',
        frameName: 'Inicio',
        frameNodeId: '8:1470',
        checkpoint: 'M4',
      ),
      routes: [
        GoRoute(
          path: 'pickup-decision',
          name: 'home-pickup-decision',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '22',
            frameName: '¿Recibiste tu medicamento? (modal)',
            frameNodeId: '65:85',
            checkpoint: 'M8',
          ),
        ),
        GoRoute(
          path: 'pickup-complete',
          name: 'home-pickup-complete',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '23',
            frameName: 'Reclamo completado (modal)',
            frameNodeId: '65:113',
            checkpoint: 'M8',
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/medicines/search',
      name: 'medicines-search',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '09',
        frameName: 'Buscar medicamento',
        frameNodeId: '8:1509',
        checkpoint: 'M5',
      ),
    ),
    GoRoute(
      path: '/medicines/results',
      name: 'medicines-results',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '10',
        frameName: 'Resultado y equivalentes',
        frameNodeId: '8:1543',
        checkpoint: 'M5',
      ),
    ),
    GoRoute(
      path: '/medicines/prescription/losartan',
      name: 'medicines-prescription-losartan',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '11.1',
        frameName: 'Datos de la fórmula (Losartán 50 mg)',
        frameNodeId: '8:1564',
        checkpoint: 'M5',
      ),
    ),
    GoRoute(
      path: '/medicines/prescription/losartan-potasico',
      name: 'medicines-prescription-losartan-potasico',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '11.2',
        frameName: 'Datos de la fórmula (Losartán potásico 50 mg)',
        frameNodeId: '8:1586',
        checkpoint: 'M5',
      ),
    ),
    GoRoute(
      path: '/medicines/prescription/losartan-mk',
      name: 'medicines-prescription-losartan-mk',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '11.3',
        frameName: 'Datos de la fórmula (Losartán MK 50 mg)',
        frameNodeId: '8:1608',
        checkpoint: 'M5',
      ),
    ),
    GoRoute(
      path: '/medicines/treatment/losartan',
      name: 'medicines-treatment-losartan',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '13.1',
        frameName: 'Tu tratamiento (Losartán 50 mg)',
        frameNodeId: '8:1666',
        checkpoint: 'M5',
      ),
    ),
    GoRoute(
      path: '/medicines/treatment/losartan-potasico',
      name: 'medicines-treatment-losartan-potasico',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '13.2',
        frameName: 'Tu tratamiento (Losartán potásico 50 mg)',
        frameNodeId: '8:1681',
        checkpoint: 'M5',
      ),
    ),
    GoRoute(
      path: '/medicines/treatment/losartan-mk',
      name: 'medicines-treatment-losartan-mk',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '13.3',
        frameName: 'Tu tratamiento (Losartán MK 50 mg)',
        frameNodeId: '8:1696',
        checkpoint: 'M5',
      ),
    ),
    GoRoute(
      path: '/locations/filters',
      name: 'locations-filters',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '14',
        frameName: 'Filtros: EPS y ciudad',
        frameNodeId: '24:35',
        checkpoint: 'M6',
      ),
    ),
    GoRoute(
      path: '/locations',
      name: 'locations',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '15',
        frameName: 'Puntos en convenio',
        frameNodeId: '24:60',
        checkpoint: 'M6',
      ),
    ),
    GoRoute(
      path: '/locations/detail',
      name: 'locations-detail',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '16',
        frameName: 'Ficha del punto',
        frameNodeId: '24:115',
        checkpoint: 'M6',
      ),
    ),
    GoRoute(
      path: '/locations/availability',
      name: 'locations-availability',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '17',
        frameName: 'Disponibilidad con sello',
        frameNodeId: '24:137',
        checkpoint: 'M6',
      ),
    ),
    GoRoute(
      path: '/appointments',
      name: 'appointments',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '21',
        frameName: 'Mis turnos',
        frameNodeId: '24:248',
        checkpoint: 'M7',
      ),
      routes: [
        GoRoute(
          path: 'schedule',
          name: 'appointments-schedule',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '18',
            frameName: 'Elegir día y franja',
            frameNodeId: '24:151',
            checkpoint: 'M7',
          ),
        ),
        GoRoute(
          path: 'confirm',
          name: 'appointments-confirm',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '19',
            frameName: 'Confirmar el turno',
            frameNodeId: '24:203',
            checkpoint: 'M7',
          ),
        ),
        GoRoute(
          path: 'confirmed',
          name: 'appointments-confirmed',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '20',
            frameName: 'Turno con hora estimada',
            frameNodeId: '24:225',
            checkpoint: 'M7',
          ),
        ),
        GoRoute(
          path: 'pending-registration',
          name: 'appointments-pending-registration',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '23',
            frameName: 'Registrar lo pendiente',
            frameNodeId: '24:338',
            checkpoint: 'M8',
          ),
        ),
        GoRoute(
          path: 'empty',
          name: 'appointments-empty',
          builder: (context, state) => const PlaceholderScreen(
            frameNumber: '26',
            frameName: 'Mis turnos (sin activos)',
            frameNodeId: '24:420',
            checkpoint: 'M7',
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/history',
      name: 'history',
      builder: (context, state) => const PlaceholderScreen(
        frameNumber: '25',
        frameName: 'Historial del reclamo',
        frameNodeId: '24:374',
        checkpoint: 'M8',
      ),
    ),
  ],
);
