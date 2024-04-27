import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/router/router.dart';
import 'config/themes/themes.dart';
import 'pages/home_page/bloc/home_page_bloc.dart';
import 'theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: darkTheme,
      initial: AdaptiveThemeMode.dark,
      builder: (light, dark) => MultiBlocProvider(
        providers: [
          // Cubits
          BlocProvider(create: (context) => ThemeCubit()),

          // BloC
          BlocProvider(create: (context) => HomePageBloc()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              title: 'Lens application',
              theme: (context.watch<ThemeCubit>().state as ThemeInitial).isDarkTheme ? dark : light,
            );
          },
        ),
      ),
    );
  }
}
