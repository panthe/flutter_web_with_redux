import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class MessageState{
  final bool isShowing;
  final String messageCode;
  final String messageDescription;

  MessageState({
    this.isShowing,
    this.messageCode,
    this.messageDescription
  });

  MessageState copyWith({
    bool isShowing,
    String messageCode,
    String messageDescription
  }){
    return MessageState(
        isShowing: isShowing ?? this.isShowing,
        messageCode: messageCode ?? this.messageCode,
        messageDescription: messageDescription ?? this.messageDescription
    );
  }

  factory MessageState.initial(){
    return MessageState(
        isShowing: false,
        messageCode: null,
        messageDescription: null
    );
  }

  static MessageState fromJson(Map<String, dynamic> json) {
    return MessageState(
      isShowing: json['isShowing'] == null ? false : json['isShowing'],
      messageCode: json['messageCode'],
      messageDescription: json['messageDescription'],
    );
  }

  Map<String, dynamic> toJson() => {
    'isShowing': isShowing,
    'messageCode': messageCode,
    'messageDescription': messageDescription,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MessageState &&
              runtimeType == other.runtimeType &&
              isShowing == other.isShowing &&
              messageCode == other.messageCode &&
              messageDescription == other.messageDescription;

  @override
  int get hashCode =>
      isShowing.hashCode ^ messageCode.hashCode ^ messageDescription.hashCode;
}
