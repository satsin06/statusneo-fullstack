import 'package:go_router/go_router.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/recommendation_page.dart';
import '../../features/onboarding/presentation/pages/subscription_summary_page.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.onboarding,
  routes: [
    GoRoute(
      path: RouteNames.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: RouteNames.recommendation,
      builder: (context, state) => const RecommendationPage(),
    ),
    GoRoute(
      path: RouteNames.subscriptionSummary,
      builder: (context, state) => const SubscriptionSummaryPage(),
    ),
  ],
);