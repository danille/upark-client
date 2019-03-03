import 'package:client/util/strings.dart';
import 'package:flutter/material.dart';

class DestinationTextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DestinationTextFieldState();

}

class _DestinationTextFieldState extends State<DestinationTextFieldWidget> {
  final textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: textFieldController,
        decoration: InputDecoration.collapsed(
          hintText: Strings.MAP_TEXT_HINT,
        ),
      ),
    );
  }
}