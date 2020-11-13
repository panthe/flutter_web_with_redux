import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';

import 'name.dart';
import 'location.dart';
import 'login.dart';
import 'dob.dart';
import 'id.dart';
import 'picture.dart';

class User {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  User(
      {this.gender,
        this.name,
        this.location,
        this.email,
        this.login,
        this.dob,
        this.registered,
        this.phone,
        this.cell,
        this.id,
        this.picture,
        this.nat});

  User.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    email = json['email'];
    login = json['login'] != null ? Login.fromJson(json['login']) : null;
    dob = json['dob'] != null ? Dob.fromJson(json['dob']) : null;
    registered = json['registered'] != null
        ? Dob.fromJson(json['registered'])
        : null;
    phone = json['phone'];
    cell = json['cell'];
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    picture =
    json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    nat = json['nat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gender'] = this.gender;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['email'] = this.email;
    if (this.login != null) {
      data['login'] = this.login.toJson();
    }
    if (this.dob != null) {
      data['dob'] = this.dob.toJson();
    }
    if (this.registered != null) {
      data['registered'] = this.registered.toJson();
    }
    data['phone'] = this.phone;
    data['cell'] = this.cell;
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    if (this.picture != null) {
      data['picture'] = this.picture.toJson();
    }
    data['nat'] = this.nat;
    return data;
  }

  static User fromStore(Store<AppState> store) {
    return store.state.userState.user;
  }
}