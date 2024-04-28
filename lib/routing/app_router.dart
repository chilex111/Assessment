import 'package:assesment_project/feature/explore/explore_page.dart';
import 'package:assesment_project/feature/login/login.dart';
import 'package:assesment_project/feature/transaction/transaction_detail.dart';
import 'package:assesment_project/feature/transaction/transaction_history.dart';
import 'package:assesment_project/routing/route_paths.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../feature/dashboard.dart';
import 'not_found_screen.dart';

/*
final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: '/dashboard',
        name: AppRoute.dashboard.name,
        builder: (context, state) => const Dashboard(),
        routes: [
          GoRoute(
            path: 'details',
            name: AppRoute.transactionDetail.name,
            builder: (context, state) => const TransactionDetail(),
          ),
        ]
      ),
    ],
    errorBuilder:
  );
}

final goRouterProvider = Provider((ref) => goRouter());


*/


final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      name: AppRoute.login.name,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/', // Update with your home route path
      name: AppRoute.dashboard.name,
      // Guards can be used here to check if user is authenticated before accessing home
      builder: (context, state) => const Dashboard(), // Replace with your home page widget
      routes: [
        GoRoute(
          path: 'transactionHistory',
          name: AppRoute.transactionHistory.name,
          builder: (context, state) => const TransactionHistory(),
            routes: [
              GoRoute(
                path: 'transactionDetail/:detail',
                name: AppRoute.transactionDetail.name,
                builder: (context, state)
                {
                  String data = state.pathParameters['detail']??"";
                  return TransactionDetail(jsonData:data);
                },
              ),
            ]
        ),
      ]
    ),
  ],
  errorBuilder:(context, state) => const NotFoundScreen() ,
  // Optionally, add redirect logic based on authentication state
  // redirect: (context, state) => null, // Replace with your redirect logic
  debugLogDiagnostics: true, // Enable for debugging logs
);

final routerProvider = Provider<GoRouter>((ref) => _router);
