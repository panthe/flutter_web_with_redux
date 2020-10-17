import 'package:flutter/material.dart';
import 'package:flutter_web_with_redux/models/user.dart';

class FetchingUser {
  bool isFetching;

  FetchingUser({
    @required this.isFetching,
  });

  toJson() {
    return {
      'isFetching': isFetching,
    };
  }
}

class FetchUser {}

class SetUser {
  final User user;

  SetUser({
    @required this.user,
  });

  toJson() {
    return {
      'user': user.toJson(),
    };
  }
}

class SavingUser {
  bool isSaving;

  SavingUser({
    @required this.isSaving,
  });

  toJson() {
    return {
      'isSaving': isSaving,
    };
  }
}