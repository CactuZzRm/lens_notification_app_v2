import 'package:bloc/bloc.dart';

import '../../../constants/lens_types.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageLoading()) {
    on<HomePageInitEvent>((event, emit) {
      DateTime? date;
      int? lensType = 0;

      emit(HomePageInitial(date: date, lensType: lensType));
    });
  }

  double angle = 360;

  DateTime? tempDate = DateTime.now();
  int tempLensTypeIndex = 0;

  void setDate(DateTime date) {
    tempDate = date;

    emit(HomePageInitial(lensType: (state as HomePageInitial).lensType, date: (state as HomePageInitial).date));
  }

  void setLensType(int typeIndex) {
    tempLensTypeIndex = typeIndex;
    
    emit(HomePageInitial(lensType: tempLensTypeIndex, date: (state as HomePageInitial).date));
  }

  void confirmDateAndLens() {
    final lensTypesValues = lensTypes.values.toList();
    DateTime nextDate = tempDate!.add(lensTypesValues[tempLensTypeIndex]);
    tempDate = nextDate; 
    
    emit(HomePageInitial(date: nextDate, lensType: tempLensTypeIndex));
  }

  void flipIcon() {
    angle != 0 ? angle = 0 : angle = 720;

    emit(HomePageInitial(lensType: (state as HomePageInitial).lensType));
  }
}
