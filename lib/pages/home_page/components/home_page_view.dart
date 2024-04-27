import 'package:flutter/material.dart';

import 'appbar.dart';
import 'end_date_widget.dart';
import 'set_date_button.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(),
            SizedBox(height: 84),
            Center(child: EndDateWidget()),
            Spacer(),
            SetDateButton(),
            SizedBox(height: 140),
          ],
        ),
      ),
    );
  }
}
