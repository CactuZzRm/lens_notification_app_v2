import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(),
            SizedBox(height: 84),
            Center(child: EndDateWidget()),
            Spacer(),
            SetDateButton(),
            SizedBox(height: 140),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 48,
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/svg/moon.svg',
              color: theme.textTheme.bodyMedium!.color,
            ),
            onPressed: () => print('bup'),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/svg/sun2.svg',
              width: 30,
              height: 30,
              color: theme.textTheme.bodyMedium!.color,
            ),
            onPressed: () => print('bup'),
          ),
        ],
      ),
    );
  }
}

class SetDateButton extends StatelessWidget {
  const SetDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: () => print('bup'),
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      ),
      child: Text(
        'Установить дату',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, color: const Color.fromRGBO(17, 21, 50, 1)),
      ),
    );
  }
}

class EndDateWidget extends StatelessWidget {
  const EndDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text('Замена линз:', style: theme.textTheme.bodyMedium!.copyWith(fontSize: 22)),
        const SizedBox(height: 2),
        Text('12.12.2012', style: theme.textTheme.bodySmall!.copyWith(fontSize: 18)),
      ],
    );
  }
}
