import 'coordinates.dart';
import 'timezone.dart';
import 'street.dart';

class Location {
  Street street;
  String city;
  String state;
  String country;
  int postcode;
  Coordinates coordinates;
  Timezone timezone;

  Location(
      {this.street,
        this.city,
        this.state,
        this.country,
        this.postcode,
        this.coordinates,
        this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street =
    json['street'] != null ? Street.fromJson(json['street']) : null;
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postcode = json['postcode'];
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
    timezone = json['timezone'] != null
        ? Timezone.fromJson(json['timezone'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.street != null) {
      data['street'] = this.street.toJson();
    }
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postcode'] = this.postcode;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    if (this.timezone != null) {
      data['timezone'] = this.timezone.toJson();
    }
    return data;
  }
}