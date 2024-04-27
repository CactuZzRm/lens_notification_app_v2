import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../error_page/error_page.dart';
import 'bloc/home_page_bloc.dart';
import 'components/home_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageLoading) {
          context.read<HomePageBloc>().add(HomePageInitEvent());
        } else if (state is HomePageInitial) {
          return const HomePageView();
        }
        return const ErrorPage();
      },
    );
  }
}
