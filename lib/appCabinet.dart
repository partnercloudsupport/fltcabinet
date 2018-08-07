import 'package:cabinet/utils/utils.dart';
import 'package:flutter/material.dart';
import 'screens/logon/index.dart';
import 'screens/patients/index.dart';

class AppCabinet extends StatefulWidget {
  final GlobalKey<NavigatorState> _navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  _AppCabinetState createState() {
    return new _AppCabinetState();
  }
}

class _AppCabinetState extends State<AppCabinet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget._navigatorKey,
      title: 'cabinet',
      theme: ThemeData(
        primaryColor: colorGlobal,
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 18.0,
            letterSpacing: 1.5,
            height: 1.1,
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        TabBarPatient.routeName: (BuildContext context) => new TabBarPatient(),
      },
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: new Container(),
        ),
        body: LogOn(),
      ),
    );
  }
}
