import 'package:go_router/go_router.dart';

import '../../pages/home_page/home_page.dart';
import '../../pages/splash_page/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/homePage',
      name: 'homePage',
      builder: (context, state) => HomePage(),
    )
  ],
);