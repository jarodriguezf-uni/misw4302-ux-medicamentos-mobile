import 'package:go_router/go_router.dart';

import '../features/affiliation/screens/eps_confirm_screen.dart';
import '../features/affiliation/screens/eps_screen.dart';
import '../features/affiliation/screens/eps_status_screen.dart';
import '../features/affiliation/screens/eps_validating_screen.dart';
import '../features/appointments/models/appointment_selection.dart';
import '../features/appointments/screens/appointment_confirm_screen.dart';
import '../features/appointments/screens/appointment_confirmed_screen.dart';
import '../features/appointments/screens/appointment_schedule_screen.dart';
import '../features/appointments/screens/appointments_list_screen.dart';
import '../features/claims/screens/claim_history_screen.dart';
import '../features/claims/screens/pending_registration_screen.dart';
import '../features/claims/screens/pickup_complete_screen.dart';
import '../features/claims/screens/pickup_decision_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/locations/screens/location_availability_screen.dart';
import '../features/locations/screens/location_detail_screen.dart';
import '../features/locations/screens/location_filters_screen.dart';
import '../features/locations/screens/locations_screen.dart';
import '../features/medicines/screens/medicine_result_screen.dart';
import '../features/medicines/screens/medicine_search_screen.dart';
import '../features/medicines/screens/prescription_screen.dart';
import '../features/medicines/screens/treatment_screen.dart';
import '../features/onboarding/screens/login_screen.dart';
import '../features/onboarding/screens/signup_screen.dart';
import '../features/onboarding/screens/verify_code_screen.dart';
import '../features/onboarding/screens/welcome_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
      routes: [
        GoRoute(
          path: 'verify-code',
          name: 'signup-verify-code',
          builder: (context, state) => const VerifyCodeScreen(),
        ),
        GoRoute(
          path: 'eps',
          name: 'signup-eps',
          builder: (context, state) => const EpsScreen(),
          routes: [
            GoRoute(
              path: 'validating',
              name: 'signup-eps-validating',
              builder: (context, state) => const EpsValidatingScreen(),
            ),
            GoRoute(
              path: 'status',
              name: 'signup-eps-status',
              builder: (context, state) => const EpsStatusScreen(),
            ),
            GoRoute(
              path: 'confirm/sanitas',
              name: 'signup-eps-confirm-sanitas',
              builder: (context, state) =>
                  const EpsConfirmScreen(epsName: 'Sanitas'),
            ),
            GoRoute(
              path: 'confirm/compensar',
              name: 'signup-eps-confirm-compensar',
              builder: (context, state) =>
                  const EpsConfirmScreen(epsName: 'Compensar'),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'pickup-decision',
          name: 'home-pickup-decision',
          builder: (context, state) => const PickupDecisionScreen(),
        ),
        GoRoute(
          path: 'pickup-complete',
          name: 'home-pickup-complete',
          builder: (context, state) => const PickupCompleteScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/medicines/search',
      name: 'medicines-search',
      builder: (context, state) => const MedicineSearchScreen(),
    ),
    GoRoute(
      path: '/medicines/results',
      name: 'medicines-results',
      builder: (context, state) => const MedicineResultScreen(),
    ),
    GoRoute(
      path: '/medicines/prescription/losartan',
      name: 'medicines-prescription-losartan',
      builder: (context, state) => const PrescriptionScreen(
        medicineName: 'Losartán 50 mg',
        nextRouteName: 'medicines-treatment-losartan',
      ),
    ),
    GoRoute(
      path: '/medicines/prescription/losartan-potasico',
      name: 'medicines-prescription-losartan-potasico',
      builder: (context, state) => const PrescriptionScreen(
        medicineName: 'Losartán potásico 50 mg',
        nextRouteName: 'medicines-treatment-losartan-potasico',
      ),
    ),
    GoRoute(
      path: '/medicines/prescription/losartan-mk',
      name: 'medicines-prescription-losartan-mk',
      builder: (context, state) => const PrescriptionScreen(
        medicineName: 'Losartán MK 50 mg',
        nextRouteName: 'medicines-treatment-losartan-mk',
      ),
    ),
    GoRoute(
      path: '/medicines/treatment/losartan',
      name: 'medicines-treatment-losartan',
      builder: (context, state) => const TreatmentScreen(
        medicineName: 'Losartán 50 mg',
        quantityLabel: '30 tabletas',
      ),
    ),
    GoRoute(
      path: '/medicines/treatment/losartan-potasico',
      name: 'medicines-treatment-losartan-potasico',
      builder: (context, state) => const TreatmentScreen(
        medicineName: 'Losartán potásico 50 mg',
        quantityLabel: '30 tabletas',
      ),
    ),
    GoRoute(
      path: '/medicines/treatment/losartan-mk',
      name: 'medicines-treatment-losartan-mk',
      builder: (context, state) => const TreatmentScreen(
        medicineName: 'Losartán MK 50 mg',
        quantityLabel: '30 tabletas',
      ),
    ),
    GoRoute(
      path: '/locations/filters',
      name: 'locations-filters',
      builder: (context, state) => const LocationFiltersScreen(),
    ),
    GoRoute(
      path: '/locations',
      name: 'locations',
      builder: (context, state) => const LocationsScreen(),
    ),
    GoRoute(
      path: '/locations/detail',
      name: 'locations-detail',
      builder: (context, state) => const LocationDetailScreen(),
    ),
    GoRoute(
      path: '/locations/availability',
      name: 'locations-availability',
      builder: (context, state) => const LocationAvailabilityScreen(),
    ),
    GoRoute(
      path: '/appointments',
      name: 'appointments',
      builder: (context, state) =>
          const AppointmentsListScreen(hasActive: true),
      routes: [
        GoRoute(
          path: 'schedule',
          name: 'appointments-schedule',
          builder: (context, state) => const AppointmentScheduleScreen(),
        ),
        GoRoute(
          path: 'confirm',
          name: 'appointments-confirm',
          builder: (context, state) {
            final selection = state.extra as AppointmentSelection? ??
                const AppointmentSelection(
                  dayLabel: 'Hoy',
                  timeLabel: '10:00 – 10:30',
                );
            return AppointmentConfirmScreen(selection: selection);
          },
        ),
        GoRoute(
          path: 'confirmed',
          name: 'appointments-confirmed',
          builder: (context, state) => const AppointmentConfirmedScreen(),
        ),
        GoRoute(
          path: 'pending-registration',
          name: 'appointments-pending-registration',
          builder: (context, state) => const PendingRegistrationScreen(),
        ),
        GoRoute(
          path: 'empty',
          name: 'appointments-empty',
          builder: (context, state) =>
              const AppointmentsListScreen(hasActive: false),
        ),
      ],
    ),
    GoRoute(
      path: '/history',
      name: 'history',
      builder: (context, state) => const ClaimHistoryScreen(),
    ),
  ],
);
