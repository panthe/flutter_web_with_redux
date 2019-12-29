import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/error/error_actions.dart';

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
    StoreProvider.of<AppState>(context).dispatch(SetErrorContext(context: context));
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

