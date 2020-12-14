abstract class SecondScreenState {
  SecondScreenState([List props = const []]) : super();
}

class SecondScreenInitState extends SecondScreenState {}

class SecondScreenNavigationState extends SecondScreenState {
  final String route;

  SecondScreenNavigationState({this.route});
}
