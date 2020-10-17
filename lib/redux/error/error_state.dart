import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ErrorState{
  final bool isShowing;
  final String errorCode;
  final String errorDescription;

  ErrorState({
    this.isShowing,
    this.errorCode,
    this.errorDescription
  });


  ErrorState copyWith({
    bool isShowing,
    String errorCode,
    String errorDescription
  }){
    return ErrorState(
        isShowing: isShowing ?? this.isShowing,
        errorCode: errorCode ?? this.errorCode,
        errorDescription: errorDescription ?? this.errorDescription
    );
  }

  factory ErrorState.initial(){
    return ErrorState(
        isShowing: false,
        errorCode: null,
        errorDescription: null
    );
  }

  static ErrorState fromJson(Map<String, dynamic> json) {
    return ErrorState(
      isShowing: json['isShowing'] == null ? false : json['isShowing'],
      errorCode: json['errorCode'],
      errorDescription: json['errorDescription'],
    );
  }

  Map<String, dynamic> toJson() => {
    'isShowing': isShowing,
    'errorCode': errorCode,
    'errorDescription': errorDescription,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ErrorState &&
              runtimeType == other.runtimeType &&
              isShowing == other.isShowing &&
              errorCode == other.errorCode &&
              errorDescription == other.errorDescription;

  @override
  int get hashCode =>
      isShowing.hashCode ^ errorCode.hashCode ^ errorDescription.hashCode;
}
