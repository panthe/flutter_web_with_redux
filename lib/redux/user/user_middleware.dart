import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_web_with_redux/config/config.dart' as config;
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/error/error_actions.dart';
import 'package:flutter_web_with_redux/models/user.dart';
import 'package:flutter_web_with_redux/models/apiResponse.dart';
import 'package:flutter_web_with_redux/redux/user/user_actions.dart';

Middleware<AppState> createUserMiddleware() {
  return (Store store, dynamic action, NextDispatcher next) async {
    if (action is FetchUser) {
      try {
        //Set UserState isFetching to true
        store.dispatch(FetchingUser(isFetching: true));

        //Call API URL (ONLY FOR EXAMPLE USE A BETTER WAY LIKE DIO)
        var response = await http.get(config.url);

        if (response.statusCode == 200) {
          // If server returns an OK response, parse the JSON.
          APIResponse res =
              APIResponse.fromJson(convert.jsonDecode(response.body));
          if (res.users != null && res.users.length > 0) {
            User user = res.users[0];

            store.dispatch(SetUser(user: user));
          } else {
            //Dispatch ShowError action and set error description
            store.dispatch(SetError(
                isShowing: true,
                errorCode: "USR003",
                errorDescription: 'Users not found!'));
          }
        } else {
          //Dispatch ShowError action and set error description
          store.dispatch(SetError(
              isShowing: true,
              errorCode: "USR002",
              errorDescription: 'Failed to load users'));
        }
      } catch (error) {
        //Dispatch ShowError action and set error description
        store.dispatch(SetError(
            isShowing: true, errorCode: "USR001", errorDescription: '$error'));
      }
      //Set UserState isFetching to false
      store.dispatch(FetchingUser(isFetching: false));
    }
    next(action);
  };
}
