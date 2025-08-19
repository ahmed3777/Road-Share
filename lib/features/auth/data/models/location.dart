import 'package:cloud_firestore/cloud_firestore.dart';

class LocationInfo {
  final GeoPoint location;
  final String address;

  LocationInfo({required this.location, required this.address});

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      location: json['location'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'address': address,
    };
  }
}