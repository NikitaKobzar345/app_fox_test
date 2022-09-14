import 'package:app_fox_test/api/questions_api.dart';
import 'package:app_fox_test/bloc/select_event.dart';
import 'package:app_fox_test/bloc/select_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectBloc extends Bloc<SelectEvent, SelectState> {
  SelectBloc(super.initialState) {
    on<SelectEvent>(_handleUserChoise);
  }

  void _handleUserChoise(SelectEvent event, Emitter emit) {
    final apiCall = fetchQuestions(event.category, event.difficulty);

    emit(SelectState(choise: apiCall));
  }
}
