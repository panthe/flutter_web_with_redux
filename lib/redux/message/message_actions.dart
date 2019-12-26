import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ShowMessage {
  final BuildContext context;
  final int messageCode;
  final String messageDescription;

  ShowMessage({
    @required this.context,
    @required this.messageCode,
    @required this.messageDescription,
  });

  @override
  String toString() {
    return 'ShowMessage{messageCode: $messageCode, messageDescription: $messageDescription}';
  }
}

class DismissMessage {
  final BuildContext context;

  DismissMessage({
    @required this.context
  });
}

