import 'package:bloc/bloc.dart';
import 'package:flutter_navigation_testing/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_navigation_testing/screens/second_screen/second_screen.dart';
import 'first_screen_event.dart';
import 'first_screen_state.dart';

class FirstScreenBloc extends Bloc<FirstScreenEvent, FirstScreenState> {
  @override
  FirstScreenState get initialState => FirstScreenInitState();

  @override
  Stream<FirstScreenState> mapEventToState(FirstScreenEvent event) async* {
    if (event is FirstScreenReadyEvent) {
      yield FirstScreenInitState();
    }

    if (event is FirstScreenGoToDashboardTapedEvent) {
      yield FirstScreenNavigationState(route: DashboardScreen.route);
    }

    if (event is FirstScreenGoToSecondScreenTapedEvent) {
      yield FirstScreenNavigationState(route: SecondScreen.route);
    }
  }
}
