import 'package:flutter/material.dart';

class SetDateButton extends StatelessWidget {
  const SetDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: () => print('bup'),
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      ),
      child: Text(
        'Установить дату',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, color: const Color.fromRGBO(17, 21, 50, 1)),
      ),
    );
  }
}