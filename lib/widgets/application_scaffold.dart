import 'package:flutter/material.dart';
import 'main_drawer/main_drawer_widget.dart';

class ApplicationScaffold extends StatelessWidget {
  const ApplicationScaffold(this.title, this.body, {Key key}) : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawerWidget(),
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
