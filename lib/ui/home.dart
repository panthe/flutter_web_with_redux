import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Widgets
import '../widgets/topbar.dart';
import '../widgets/topbartabs.dart';
import '../widgets/gridusers.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Center(
          child:Container(
            constraints: BoxConstraints(
              minWidth: 480.0,
              maxWidth: 1024.0,
              minHeight: 480.0,
            ),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                TopBar(),
                TopBarTabs(),
                Expanded(
                  child: GridUsers(),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}

