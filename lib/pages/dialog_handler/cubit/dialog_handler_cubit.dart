import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../dialog_handler.dart';

part 'dialog_handler_state.dart';

class DialogHandlerCubit extends Cubit<DialogHandlerState> {
  DialogHandlerCubit() : super(DialogHandlerInitial());

  final DialogHandler dialogHandler = DialogHandler();
}
