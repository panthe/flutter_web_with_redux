import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class MessageState{
  final BuildContext context;
  final bool isShowing;
  final int messageCode;
  final String messageDescription;

  MessageState({
    this.context,
    this.isShowing,
    this.messageCode,
    this.messageDescription
  });

  MessageState copyWith({
    BuildContext context,
    bool isShowing,
    int messageCode,
    String messageDescription
  }){
    return new MessageState(
        context: context ?? this.context,
        isShowing: isShowing ?? this.isShowing,
        messageCode: messageCode ?? this.messageCode,
        messageDescription: messageDescription ?? this.messageDescription
    );
  }

  factory MessageState.initial(){
    return new MessageState(
      context: null,
      isShowing: false,
      messageCode: 0,
      messageDescription: ""
    );
  }
}