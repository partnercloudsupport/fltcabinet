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
    final FocusNode _focusDateNat = new FocusNode();
    final FocusNode _focusLieuNat = new FocusNode();

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
                      child: new Container(
                          padding: EdgeInsets.only(left: 50.0, right: 50.0),
                          child: new Form(
                            key: _keyForm,
                            onChanged: () {
                              setState(() {
                                _keyForm.currentState.validate();
                              });
                            },
                            child: new Column(children: <Widget>[
                              new EnsureVisibleWhenFocused(
                                  focusNode: _focusLogin,
                                  child: new TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'LOGIN'),
                                      validator: (login) {
                                        if (isNull(login))
                                          return 'Champ obligatoire';
                                      })),
                              new EnsureVisibleWhenFocused(
                                  focusNode: _focusNom,
                                  child: new TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'NOM'),
                                      validator: (nom) {
                                        if (isNull(nom))
                                          return 'Champ obligatoire';
                                      })),
                              new EnsureVisibleWhenFocused(
                                  focusNode: _focusPrenom,
                                  child: new TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'PRENOM'),
                                      validator: (prenom) {
                                        if (isNull(prenom))
                                          return 'Champ obligatoire';
                                      })),
                              new EnsureVisibleWhenFocused(
                                  focusNode: _focusDateNat,
                                  child: new TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'DATE'),
                                      validator: (datenat) {
                                        if (isNull(datenat))
                                          return 'Champ obligatoire';
                                      })),
                              new EnsureVisibleWhenFocused(
                                  focusNode: _focusLieuNat,
                                  child: new TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'LIEU NAISSANCE'),
                                      validator: (lieunat) {
                                        if (isNull(lieunat))
                                          return 'Champ obligatoire';
                                      })),
                            ]),
                          ))),
                ]))),
      );
    });
  }
}
