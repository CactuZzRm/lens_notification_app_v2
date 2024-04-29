import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/home_page_bloc.dart';
import 'dialog_buttons.dart';
import 'lens_type_dialog_window.dart';
import 'styled_date_picker_widget.dart';

class DatepickerDialogWindow extends StatelessWidget {
  const DatepickerDialogWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: (lensTypeDialogGlobalKey.currentContext!.findRenderObject() as RenderBox).size.height,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Выберите дату', style: theme.textTheme.bodyLarge),
          const Expanded(child: StyledDatePickerWidget()),
          DialogButtons(
            acceptButtonOnPressed: () {
              context.pop();
              context.pop();
              context.read<HomePageBloc>().confirmDateAndLens();
            },
          ),
        ],
      ),
    );
  }
}
