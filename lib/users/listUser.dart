import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;
import '../services/userService.dart';
import '../interface/user.dart';

class ListUser extends StatelessWidget {
  static const String rootName = '/listeuser';
  List<User> users = listUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des users'),
        backgroundColor: utils.colorGlobal,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Dismissible(
            key: Key(user.login),
            background: Container(color: utils.colorGlobal,),
            onDismissed: (direction) {
              users.removeAt(index);
              Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Supprimé ${user.login}'),
                    backgroundColor: utils.colorGlobal,
                  ));
            },
            child: ListTile(
              title: Text(users[index].login),
              subtitle: Text(users[index].passwd),
            ),
          );
        },
      ),
    );
  }
}
