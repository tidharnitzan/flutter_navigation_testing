import 'package:bloc/bloc.dart';
import 'package:flutter_navigation_testing/screens/first_screen/first_screen.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitState());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is DashboardReadyEvent) {
      yield DashboardInitState();
    }

    if (event is DashboardGoToFirstScreenTapedEvent) {
      yield DashboardNavigationState(route: FirstScreen.route);
    }
  }
}
