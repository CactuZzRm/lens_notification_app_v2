import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

import '../bloc/home_page_bloc.dart';

class EndDateWidget extends StatelessWidget {
  const EndDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        final bool isDateSet = (context.watch<HomePageBloc>().state as HomePageInitial).date != null;

        return Column(
          children: [
            Text('Замена линз:', style: theme.textTheme.bodyMedium!.copyWith(fontSize: 22)),
            const SizedBox(height: 2),
            Text(
              isDateSet
                  ? DateFormat('dd:MM:yyyy').format((context.watch<HomePageBloc>().state as HomePageInitial).date!)
                  : 'Интервал не задан',
              style: theme.textTheme.bodySmall!.copyWith(fontSize: 18),
            ),
          ],
        );
      },
    );
  }
}
