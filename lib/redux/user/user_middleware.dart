import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_web_with_redux/redux/config.dart' as config;
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/error/error_actions.dart';
import 'package:flutter_web_with_redux/models/user.dart';
import 'package:flutter_web_with_redux/models/apiResponse.dart';
import 'user_actions.dart';

Middleware<AppState> createUserMiddleware() {
  return (Store store, dynamic action, NextDispatcher next) async {
    if (action is FetchUser) {

      try {
        var response = await http.get(config.url);
        if (response.statusCode == 200) {
          debugPrint(response.body);
          // If server returns an OK response, parse the JSON.
          APIResponse res = APIResponse.fromJson(convert.jsonDecode(response.body));
          if (res.users != null && res.users.length>0){
            User user = res.users[0];

            store.dispatch(SetUser(user: user));
          }else{
            throw Exception('Failed to load users');
          }

        } else {
          // If that response was not OK, throw an error.
          throw Exception('Failed to load users');
        }
      } catch (error) {
        store.dispatch(ShowError(errorCode: error.hashCode, errorDescription: error.toString()));
      }
      store.dispatch(FetchingUser(isFetching: false));
    }

    next(action);
  };
}