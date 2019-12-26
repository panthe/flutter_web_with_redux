import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_with_redux/models/user.dart';

class FetchingUser {
  bool isFetching;

  FetchingUser({
    @required this.isFetching,
  });
}

class FetchUser {
  BuildContext context;

  FetchUser({
    @required this.context,
  });
}

class SetUser {
  final User user;

  SetUser({
    @required this.user,
  });
}

class SavingUser {
  bool isSaving;

  SavingUser({
    @required this.isSaving,
  });
}