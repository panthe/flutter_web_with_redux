import 'package:flutter/foundation.dart';

class SetMessage {
  final bool isShowing;
  final String messageCode;
  final String messageDescription;

  SetMessage({
    @required this.isShowing,
    @required this.messageCode,
    @required this.messageDescription,
  });

  toJson() {
    return {
      'isShowing': isShowing,
      'messageCode': messageCode,
      'messageDescription': messageDescription
    };
  }
}

class DismissMessage {}

