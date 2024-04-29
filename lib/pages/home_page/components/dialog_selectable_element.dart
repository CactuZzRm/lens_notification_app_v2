import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_page_bloc.dart';

class DialogSelectableElement extends StatelessWidget {
  const DialogSelectableElement({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.all(0),
          onTap: () {
            context.read<HomePageBloc>().setLensType(value);
          },
          leading: Radio(
            value: value,
            groupValue: (context.watch<HomePageBloc>().state as HomePageInitial).lensType,
            fillColor: MaterialStateProperty.all(theme.textTheme.bodyMedium!.color),
            onChanged: (value) {},
          ),
          title: Text(text, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 22)),
        );
      },
    );
  }
}
