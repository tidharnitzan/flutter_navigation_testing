abstract class DashboardState {
  DashboardState([List props = const []]) : super();
}

class DashboardInitState extends DashboardState {}

class DashboardNavigationState extends DashboardState {
  final String route;

  DashboardNavigationState({this.route});
}
