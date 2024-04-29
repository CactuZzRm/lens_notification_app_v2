part of 'home_page_bloc.dart';


class HomePageState {}

class HomePageLoading extends HomePageState {} 

class HomePageInitial extends HomePageState {
  final DateTime? date;
  final int lensType;

  HomePageInitial({this.date, required this.lensType});
}
