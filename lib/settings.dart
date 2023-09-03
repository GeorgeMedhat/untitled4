import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsScreen extends StatefulWidget{
  const settingsScreen({super.key});

  @override
  State<StatefulWidget> createState()=>settingsScreenState();

}
class settingsScreenState extends State<settingsScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("settings"),
      ),
    );
  }

}