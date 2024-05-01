import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_page_bloc.dart';

class StyledDatePickerWidget extends StatelessWidget {
  const StyledDatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontSize: 24,
            color: theme.textTheme.bodyMedium!.color,
          ),
        ),
      ),
      child: CupertinoDatePicker(
        initialDateTime: (context.watch<HomePageBloc>().state as HomePageInitial).date ?? DateTime.now(),
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (DateTime newDate) {
          context.read<HomePageBloc>().setDate(newDate);
        },
      ),
    );
  }
}
