import 'package:flutter_navigation_testing/models/main_drawer_item.dart';

abstract class MainDrawerState {
  MainDrawerState([List props = const []]) : super();
}

class MainDrawerNavigationState extends MainDrawerState {
  final MainDrawerItem selectedItem;

  MainDrawerNavigationState({this.selectedItem});
}

class MainDrawerGetItemsState extends MainDrawerState {
  final List<MainDrawerItem> items;

  MainDrawerGetItemsState({this.items});
}
