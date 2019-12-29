import 'package:flutter/material.dart';
import 'package:flutter_web_with_redux/redux/error/error_actions.dart';

// Redux
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/store.dart';
import 'redux/app/app_state.dart';

// UI
import './ui/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final Store<AppState> store = createStore();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web with Redux',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          dividerColor: Colors.grey[300],
          primaryColor: Colors.orange,
          backgroundColor: Colors.grey[200],
          cardColor: Colors.white
      ),
      home: StoreProvider<AppState>(
          store: store,
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: HomePage(),
          )
      ),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}


