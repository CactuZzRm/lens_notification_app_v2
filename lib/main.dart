import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'config/router/router.dart';
import 'config/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: darkTheme,
      initial: AdaptiveThemeMode.dark,
      builder: (light, dark) => MaterialApp.router(        
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: light
      ),
    );
  }
}
