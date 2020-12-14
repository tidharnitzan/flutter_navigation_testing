import 'package:bloc/bloc.dart';
import 'package:flutter_navigation_testing/screens/first_screen/first_screen.dart';
import 'second_screen_event.dart';
import 'second_screen_state.dart';

class SecondScreenBloc extends Bloc<SecondScreenEvent, SecondScreenState> {
  @override
  SecondScreenState get initialState => SecondScreenInitState();

  @override
  Stream<SecondScreenState> mapEventToState(SecondScreenEvent event) async* {
    if (event is SecondScreenReadyEvent) {
      yield SecondScreenInitState();
    }

    if (event is SecondScreenGoToFirstScreenTapedEvent) {
      yield SecondScreenNavigationState(route: FirstScreen.route);
    }
  }
}
