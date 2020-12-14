import 'package:flutter_navigation_testing/models/main_drawer_item.dart';

abstract class MainDrawerEvent {}

class MainDrawerNavigationEvent extends MainDrawerEvent {
  final MainDrawerItem drawerItem;

  MainDrawerNavigationEvent({this.drawerItem});
}

class MainDrawerGetItemsEvent extends MainDrawerEvent {}
