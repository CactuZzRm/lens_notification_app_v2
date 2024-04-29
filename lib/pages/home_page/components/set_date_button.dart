import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dialog_handler/cubit/dialog_handler_cubit.dart';
import '../bloc/home_page_bloc.dart';

class SetDateButton extends StatelessWidget {
  const SetDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return BlocBuilder<DialogHandlerCubit, DialogHandlerState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () => context.read<DialogHandlerCubit>().dialogHandler.showLensTypeDialog(context),
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
              ),
              child: Text(
                (context.watch<HomePageBloc>().state as HomePageInitial).date != null
                    ? 'Изменить дату'
                    : 'Установить дату',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, color: const Color.fromRGBO(17, 21, 50, 1)),
              ),
            );
          },
        );
      },
    );
  }
}
