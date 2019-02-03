import 'package:client/util/strings.dart';
import 'package:flutter/material.dart';

void main() => runApp(UparkApp());

class UparkApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Strings.APP_NAME,
        home: Scaffold(appBar: AppBar(title: Text('Welcome to UPark')),
            body: Center(child: Text('UPark '))
        ));
  }
}