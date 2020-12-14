import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_testing/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_navigation_testing/screens/dashboard/bloc/dashboard_event.dart';
import 'package:flutter_navigation_testing/widgets/application_scaffold.dart';
import 'bloc/dashboard_state.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  static String route = 'dasboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardBloc _bloc;

  @override
  void initState() {
    _bloc = DashboardBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      'Dasboard',
      BlocProvider<DashboardBloc>(
        create: (_) => _bloc,
        child: BlocConsumer<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardInitState) {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 50,
                ),
                child: ListView(
                  children: [
                    Text('This is the Dashboard Screen!'),
                    RaisedButton(
                        child: Text('Go to first screen'),
                        onPressed: () {
                          _bloc.add(DashboardGoToFirstScreenTapedEvent());
                        }),
                  ],
                ),
              );
            }
            return Text('Stateless Case');
          },
          listener: (context, state) {
            if (state is DashboardNavigationState) {
              Navigator.pushNamed(context, state.route);
            }
          },
        ),
      ),
    );
  }
}
