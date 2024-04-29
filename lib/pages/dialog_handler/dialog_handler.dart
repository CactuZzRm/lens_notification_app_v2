import 'package:flutter/material.dart';
import 'package:lens_notification_app/pages/home_page/components/datepicker_dialog_window.dart';

import '../home_page/components/lens_type_dialog_window.dart';

class DialogHandler {
  showLensTypeDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: LensTypeDialogWindow(),
      ),
    );
  }

  showDatePickerDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: DatepickerDialogWindow(),
      ),
    );
  }
}
