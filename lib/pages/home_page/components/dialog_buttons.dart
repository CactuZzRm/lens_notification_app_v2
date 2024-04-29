import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogButtons extends StatelessWidget {
  const DialogButtons({super.key, this.acceptButtonOnPressed, this.cancelButtonOnPressed});

  final Function()? acceptButtonOnPressed;
  final Function()? cancelButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: cancelButtonOnPressed ?? () => context.pop(),
          style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          child: Text('Отмена', style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16)),
        ),
        TextButton(
          onPressed: acceptButtonOnPressed,
          style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          child: Text('Подтвердить', style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16)),
        ),
      ],
    );
  }
}