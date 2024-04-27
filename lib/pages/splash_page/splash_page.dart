import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((_) => context.pushNamed('homePage'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Lens application',
              style: TextStyle(fontSize: 28),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
