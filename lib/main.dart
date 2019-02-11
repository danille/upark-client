import 'package:client/data/api_manager.dart';
import 'package:client/ui/home_screen.dart';
import 'package:client/util/strings.dart';
import 'package:flutter/material.dart';

void main() => runApp(UparkApp());

class UparkApp extends StatelessWidget {

  Widget build(BuildContext context) {
    ApiManager apiManager = ApiManager();
    return MaterialApp(
        title: Strings.APP_NAME,
        home: HomeScreen(apiManager));
  }
}