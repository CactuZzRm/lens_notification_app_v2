import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math' as math;

import '../../../theme_cubit.dart';
import '../bloc/home_page_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 800),
                          firstChild: SvgPicture.asset(
                            'assets/icons/svg/moon.svg',
                            color: const Color.fromRGBO(84, 125, 189, 1),
                          ),
                          secondChild: SvgPicture.asset(
                            'assets/icons/svg/sun2.svg',
                            color: const Color.fromRGBO(230, 233, 70, 1),
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
