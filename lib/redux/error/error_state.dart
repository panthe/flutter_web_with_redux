import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ErrorState{
  final BuildContext context;
  final bool isShowing;
  final int errorCode;
  final String errorDescription;

  ErrorState({
    this.context,
    this.isShowing,
    this.errorCode,
    this.errorDescription
  });


  ErrorState copyWith({
    BuildContext context,
    bool isShowing,
    int errorCode,
    String errorDescription
  }){
    return new ErrorState(
        context: context ?? this.context,
        isShowing: isShowing ?? this.isShowing,
        errorCode: errorCode ?? this.errorCode,
        errorDescription: errorDescription ?? this.errorDescription
    );
  }

  factory ErrorState.initial(){
    return new ErrorState(
      context: null,
      isShowing: false,
      errorCode: 0,
      errorDescription: ""
    );
  }
}
