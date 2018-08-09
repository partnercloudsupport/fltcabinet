import 'package:flutter/material.dart';
import '../../icons/icon.dart';
import '../../utils/utils.dart' as utils;
import 'tabs/medecin-tab.dart';
import 'tabs/parametre-tab.dart';
import 'tabs/prendre-rdv-tab.dart';
import 'tabs/profil-tab.dart';

class TabBarPatient extends StatefulWidget {
  static const String routeName = '/patient';

  @override
  TabBarPatientState createState() {
    return new TabBarPatientState();
  }
}

class TabBarPatientState extends State<TabBarPatient>
    with SingleTickerProviderStateMixin {
  Navigator navigator;
  GlobalKey<NavigatorState> navKey = GlobalKey();
  TabController tabController;

  @override
  void initState() {
    super.initState();
    navigator = _getNavigator('/monprofil');
    tabController = new MyTabController(
        length: 4,
        vsync: this,
        initialIndex: 3,
        callBack: (index) {
          if (index == 3) {
            ProfilTab();
          } else {
            navKey.currentState.pushReplacementNamed('/$index');
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    print('\nCOMMENCE DANS LA PARTIE PATIENT');
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), child: new Container()),
      // backgroundColor: utils.colorBase,
      body: navigator,
      bottomNavigationBar: new Material(
          color: Colors.white70,
          child: new TabBar(
              indicatorColor: utils.colorGlobal,
              controller: tabController,
              tabs: <Widget>[
                new Tab(
                    child: new Icon(CabinetIcon.account,
                        color: utils.colorGlobal)),
                new Tab(
                    child: new Icon(CabinetIcon.location,
                        color: utils.colorGlobal)),
                new Tab(
                    child: new Icon(CabinetIcon.calendar,
                        color: utils.colorGlobal)),
                new Tab(
                    child:
                        new Icon(CabinetIcon.home, color: utils.colorGlobal)),
              ])),
    );
  }

  Navigator _getNavigator(String initialroot) {
    return new Navigator(
        key: navKey,
        initialRoute: initialroot,
        onGenerateRoute: (RouteSettings setting) {
          print('\nSETTING IN _getNavigator() setting : $setting');
          switch (setting.name) {
            case '/':
              return new MaterialPageRoute(
                  builder: (_) => ProfilTab(), settings: setting);
            case '/monprofil':
              return new MaterialPageRoute(
                  builder: (_) => ProfilTab(), settings: setting);
            case '/0':
              return new MaterialPageRoute(
                  builder: (_) => ProfilTab(), settings: setting);
            case '/1':
              return new MaterialPageRoute(
                  builder: (_) => MedecinTab(), settings: setting);
            case '/2':
              return new MaterialPageRoute(
                  builder: (_) => PrendreRdvTab(), settings: setting);
            case '/3':
              return new MaterialPageRoute(
                  builder: (_) => ParametreTab(), settings: setting);
          }
        });
  }
}

typedef void TabChangedHandler(int tab);

class MyTabController extends TabController {
  TabChangedHandler callBack;
  MyTabController({
    int initialIndex,
    @required int length,
    @required TickerProvider vsync,
    this.callBack,
  }) : super(initialIndex: initialIndex, length: length, vsync: vsync) {
    '';
  }

  @override
  void animateTo(int value,
      {Duration duration: kTabScrollDuration, Curve curve: Curves.easeIn}) {
    if (value != 4) {
      this.callBack(value);
    }
    if (value != 3) {
      if (value == 4) {
        value = 3;
      }
      super.animateTo(value, duration: duration, curve: curve);
    }
  }
}
