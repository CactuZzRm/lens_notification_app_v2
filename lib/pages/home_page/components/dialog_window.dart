import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dialog_selectable_element.dart';

class DialogWindow extends StatelessWidget {
  const DialogWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
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
          const DialogSelectableElement(text: 'Ежедневные', value: 0),
          const DialogSelectableElement(text: 'Двухнедельные', value: 1),
          const DialogSelectableElement(text: 'Ежемесячные', value: 2),
          const DialogSelectableElement(text: 'Ежеквартальные', value: 3),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              child: Text('Отмена', style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16)),
              onPressed: () => context.pop(),
            ),
          ),
        ],
      ),
    );
  }
}