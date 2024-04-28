import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      // onTap: () => context.pop(),
      onTap: () => showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: CupertinoTheme(            
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(                
                dateTimePickerTextStyle: TextStyle(
                  fontSize: 24,
                  color: theme.textTheme.bodyMedium!.color,
                ),
              ),
            ),
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDate) {
                // setState(() => date = newDate);
              },
            ),
          ),
        ),
      ),
      leading: Radio(
        value: value,
        groupValue: 0,
        onChanged: (value) {},
      ),
      title: Text(text, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 22)),
    );
  }
}
