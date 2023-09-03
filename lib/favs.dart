import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favScreen extends StatefulWidget{
  const favScreen({super.key});

  @override
  State<StatefulWidget> createState()=>favScreenState();

}
class favScreenState extends State<favScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("favs"),
      ),
    );
  }

}