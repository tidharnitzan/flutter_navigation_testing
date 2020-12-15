import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_testing/screens/first_screen/bloc/first_screen_bloc.dart';
import 'package:flutter_navigation_testing/screens/first_screen/bloc/first_screen_event.dart';
import 'package:flutter_navigation_testing/widgets/application_scaffold.dart';

import 'bloc/first_screen_state.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  static String route = 'first_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      'First Screen',
      BlocProvider<FirstScreenBloc>(
        create: (_) => FirstScreenBloc(),
        child: BlocConsumer<FirstScreenBloc, FirstScreenState>(
          listener: (context, state) {
            if (state is FirstScreenNavigationState) {
              Navigator.pushNamed(context, state.route);
            }
          },
          buildWhen: (previous, current) =>
              !(current is FirstScreenNavigationState),
          builder: (context, state) {
            if (state is FirstScreenInitState) {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 50,
                ),
                child: ListView(
                  children: [
                    Text('This is the FirstScreen Screen!'),
                    RaisedButton(
                        child: Text('Go to dashboard screen'),
                        onPressed: () {
                          context
                              .bloc<FirstScreenBloc>()
                              .add(FirstScreenGoToDashboardTapedEvent());
                        }),
                    RaisedButton(
                        child: Text('Go to second screen'),
                        onPressed: () {
                          context
                              .bloc<FirstScreenBloc>()
                              .add(FirstScreenGoToSecondScreenTapedEvent());
                        }),
                  ],
                ),
              );
            }

            return Text('Stateless Case');
          },
        ),
      ),
    );
  }
}
