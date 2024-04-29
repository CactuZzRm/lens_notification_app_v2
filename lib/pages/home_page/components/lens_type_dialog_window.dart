import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/lens_types.dart';
import '../../dialog_handler/cubit/dialog_handler_cubit.dart';
import '../bloc/home_page_bloc.dart';
import 'dialog_buttons.dart';
import 'dialog_selectable_element.dart';

GlobalKey lensTypeDialogGlobalKey = GlobalKey();

class LensTypeDialogWindow extends StatelessWidget {
  const LensTypeDialogWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Container(
          key: lensTypeDialogGlobalKey,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Выберете тип линз', style: theme.textTheme.bodyLarge),
              const SizedBox(height: 8),
              DialogSelectableElement(text: lensTypes[0], value: 0),
              DialogSelectableElement(text: lensTypes[1], value: 1),
              DialogSelectableElement(text: lensTypes[2], value: 2),
              DialogSelectableElement(text: lensTypes[3], value: 3),
              const SizedBox(height: 12),
              DialogButtons(
                acceptButtonOnPressed: () =>
                    context.read<DialogHandlerCubit>().dialogHandler.showDatePickerDialog(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
