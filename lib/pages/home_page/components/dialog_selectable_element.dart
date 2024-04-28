import 'package:flutter/material.dart';

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

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () => print('Aboba'),
      leading: Radio(
        value: value,
        groupValue: 0,
        onChanged: (value) {},
      ),
      title: Text(text, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 22)),
    );
  }
}
