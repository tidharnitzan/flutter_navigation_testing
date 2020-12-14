import 'package:flutter_navigation_testing/screens/first_screen/first_screen.dart';
import 'package:flutter_navigation_testing/screens/second_screen/second_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';

getRoutes() {
  return {
    DashboardScreen.route: (context) => DashboardScreen(),
    FirstScreen.route: (context) => FirstScreen(),
    SecondScreen.route: (context) => SecondScreen(),
  };
}
