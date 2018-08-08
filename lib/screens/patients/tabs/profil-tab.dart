import 'package:flutter/material.dart';
import 'package:validator/validator.dart';
import '../../../components/CabinetTitle.dart';
import '../../../components/ensureVisibleWhenFocus.dart';

class ProfilTab extends StatefulWidget {
  @override
  _ProfilTabState createState() => _ProfilTabState();
}

class _ProfilTabState extends State<ProfilTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _keyForm = new GlobalKey<FormState>();
    final FocusNode _focusLogin = new FocusNode();
    final FocusNode _focusNom = new FocusNode();
    final FocusNode _focusPrenom = new FocusNode();

    return new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      print('BoxConstraints : $viewportConstraints');
      return SingleChildScrollView(
        child: new ConstrainedBox(
          constraints:
              new BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: new IntrinsicHeight(
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      alignment: Alignment.centerRight,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: new CabinetTitle('PROFIL')),
                  new Expanded(
                    // A flexible child that will grow to fit the viewport but
                    // still be at least as big as necessary to fit its contents.
                    child: new Container(height: 80.0),
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
