import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_testing/widgets/main_drawer/bloc/main_drawer_bloc.dart';
import 'package:flutter_navigation_testing/widgets/main_drawer/bloc/main_drawer_event.dart';
import 'package:flutter_navigation_testing/widgets/main_drawer/bloc/main_drawer_state.dart';
import 'package:flutter_navigation_testing/models/main_drawer_item.dart';

class MainDrawerWidget extends StatefulWidget {
  @override
  _MainDrawerWidgetState createState() => _MainDrawerWidgetState();
}

class _MainDrawerWidgetState extends State<MainDrawerWidget> {
  MainDrawerBloc _bloc;

  @override
  void initState() {
    _bloc = MainDrawerBloc();
    _bloc.add(MainDrawerGetItemsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => _bloc,
        child: BlocConsumer<MainDrawerBloc, MainDrawerState>(
          listener: (context, state) {
            if (state is MainDrawerNavigationState) {
              Navigator.pushReplacementNamed(context, state.selectedItem.route);
            }
          },
          builder: (context, state) {
            if (state is MainDrawerGetItemsState) {
              return Drawer(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      MainDrawerItemWidget(state.items[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: state.items?.length ?? 0,
                ),
              );
            }

            return Text('Stateless Case');
          },
        ),
      );
}

class MainDrawerItemWidget extends StatelessWidget {
  const MainDrawerItemWidget(this.item, {Key key}) : super(key: key);

  final MainDrawerItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(item.header),
        onTap: () {
          context.bloc<MainDrawerBloc>().add(
                MainDrawerNavigationEvent(drawerItem: item),
              );
        },
      ),
    );
  }
}
