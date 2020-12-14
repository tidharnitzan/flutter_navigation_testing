import 'package:bloc/bloc.dart';
import 'package:flutter_navigation_testing/models/main_drawer_item.dart';
import 'package:flutter_navigation_testing/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_navigation_testing/screens/first_screen/first_screen.dart';
import 'package:flutter_navigation_testing/screens/second_screen/second_screen.dart';
import 'main_drawer_event.dart';
import 'main_drawer_state.dart';

class MainDrawerBloc extends Bloc<MainDrawerEvent, MainDrawerState> {
  List<MainDrawerItem> _items = List<MainDrawerItem>();
  MainDrawerItem _currentItem;

  @override
  MainDrawerState get initialState => MainDrawerGetItemsState();

  MainDrawerBloc() {
    _items
        .add(MainDrawerItem(header: 'Dashboard', route: DashboardScreen.route));
    _items
        .add(MainDrawerItem(header: 'First Screen', route: FirstScreen.route));
    _items.add(
        MainDrawerItem(header: 'Second Screen', route: SecondScreen.route));
  }

  @override
  Stream<MainDrawerState> mapEventToState(MainDrawerEvent event) async* {
    if (event is MainDrawerGetItemsEvent) {
      yield MainDrawerGetItemsState(items: _items);
    }

    if (event is MainDrawerNavigationEvent) {
      if (event.drawerItem != _currentItem) {
        _currentItem = event.drawerItem;
        yield MainDrawerNavigationState(selectedItem: event.drawerItem);
      }
    }
  }
}
