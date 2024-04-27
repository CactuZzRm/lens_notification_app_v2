import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:math' as math;

import '../../theme_cubit.dart';
import 'bloc/home_page_bloc.dart';

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
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          const Spacer(),
          BlocBuilder<HomePageBloc, HomePageState>(
            builder: (context, state) {
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return IconButton(
                    icon: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: context.watch<HomePageBloc>().angle),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOutBack,
                      builder: (context, value, child) => Transform.rotate(
                        angle: value * math.pi / 180,
                        child: AnimatedCrossFade(
                          duration: const Duration(milliseconds: 800),
                          firstChild: SvgPicture.asset(
                            'assets/icons/svg/sun2.svg',
                            color: const Color.fromRGBO(230, 233, 70, 1),
                          ),
                          secondChild: SvgPicture.asset(
                            'assets/icons/svg/moon.svg',
                            color: const Color.fromRGBO(84, 125, 189, 1),
                          ),
                          crossFadeState: (context.watch<ThemeCubit>().state as ThemeInitial).isDarkTheme
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                        ),
                      ),
                      // child:
                    ),
                    onPressed: () {                      
                      context.read<ThemeCubit>().changeTheme(context);
                      context.read<HomePageBloc>().flipIcon();
                      // context.read<HomePageBloc>().changeIcon();
                    },
                    // onPressed: () => print('bup'),
                  );
                },
              );
            },
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
