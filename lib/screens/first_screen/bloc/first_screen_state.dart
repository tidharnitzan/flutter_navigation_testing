abstract class FirstScreenState {
  FirstScreenState([List props = const []]) : super();
}

class FirstScreenInitState extends FirstScreenState {}

class FirstScreenNavigationState extends FirstScreenState {
  final String route;

  FirstScreenNavigationState({this.route});
}
