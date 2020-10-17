import 'package:flutter/material.dart';
import 'package:flutter_web_with_redux/config/keys.dart';
import 'package:flutter_web_with_redux/widgets/error_notifier.dart';
import 'package:flutter_web_with_redux/widgets/message_notifier.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_with_redux/redux/store.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/ui/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final Store<AppState> store = createStore();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Web with Redux',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          dividerColor: Colors.grey[300],
          primaryColor: Colors.orange,
          backgroundColor: Colors.grey[200],
          cardColor: Colors.white,
        ),
        home: Scaffold(
          key: Keys.scaffoldKey,
          body: SafeArea(
            child: ErrorNotifier(
              child: MessageNotifier(
                child: HomePage(),
              ),
            ),
          ),
        ),
        routes: {
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
