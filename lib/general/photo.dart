import 'dart:convert';

import '../utils/utils.dart' as utils;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() => runApp(new MaterialApp(
      home: new Photo(),
    ));

class Photo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PhotosState();
}

class PhotosState extends State<Photo> {
  final urlPhoto = "https://jsonplaceholder.typicode.com/posts";
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Connection with http',
          style: utils.getMyStyle(),
        ),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Padding(padding: const EdgeInsets.all(2.0),),
                          new Text(data[index]['title']),
                          new Padding(padding: const EdgeInsets.all(2.0),),
                          new Text(data[index]['body']),
                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getDataPhoto();
  }

  Future<String> getDataPhoto() async {
    var response = await http
        .get(Uri.encodeFull(urlPhoto), headers: {"Accept": "application/json"});
    setState(() {
      var respJson = JSON.decode(response.body);
      data = respJson;
    });
    return "Successfull";
  }
}
