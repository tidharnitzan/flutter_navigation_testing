import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_testing/widgets/application_scaffold.dart';
import 'bloc/second_screen_bloc.dart';
import 'bloc/second_screen_event.dart';
import 'bloc/second_screen_state.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);

  static String route = 'second_screen';

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  SecondScreenBloc _bloc;

  @override
  void initState() {
    _bloc = SecondScreenBloc();
    _bloc.add(SecondScreenReadyEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      'Second Screen',
      BlocProvider<SecondScreenBloc>(
        create: (_) => _bloc,
        child: BlocConsumer<SecondScreenBloc, SecondScreenState>(
          buildWhen: (previous, current) =>
              !(current is SecondScreenNavigationState),
          builder: (context, state) {
            if (state is SecondScreenInitState) {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 50,
                ),
                child: ListView(
                  children: [
                    Text('This is the SecondScreen Screen!'),
                    RaisedButton(
                        child: Text('Go to first screen'),
                        onPressed: () {
                          _bloc.add(SecondScreenGoToFirstScreenTapedEvent());
                        }),
                  ],
                ),
              );
            }
            return Text('Stateless Case');
          },
          listener: (context, state) {
            if (state is SecondScreenNavigationState) {
              Navigator.pushNamed(context, state.route);
            }
          },
        ),
      ),
    );
  }
}
