import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/home_page_bloc.dart';
import 'lens_type_dialog_window.dart';

class SetDateButton extends StatelessWidget {
  const SetDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return ElevatedButton(
          // onPressed: () => showDialog(context: context, builder: (context) => const Dialog(child: LensTypeDialogWindow())),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => Dialog(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: const LensTypeDialogWindow(),
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
          ),
          child: Text(
            (context.watch<HomePageBloc>().state as HomePageInitial).date != null ? 'Изменить дату' : 'Установить дату',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, color: const Color.fromRGBO(17, 21, 50, 1)),
          ),
        );
      },
    );
  }
}
