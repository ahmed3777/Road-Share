
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'vehicle_info.dart';

class AppUser {
  final String uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? photoUrl;
  final String? role; // 'driver' or 'rider'
  final String? createdAt;
  final GeoPoint? location;
  final bool? isAvailable;
  final VehicleInfo? vehicleInfo;
  final double? rating;
  final int? totalTrips;

  AppUser({
    required this.uid,
    this.name,
    this.email,
    this.phone,
    this.photoUrl,
    this.role,
    this.createdAt,
    this.location,
    this.isAvailable,
    this.vehicleInfo,
    this.rating,
    this.totalTrips,
  });

  // Factory: from Firestore
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photoUrl: json['photoUrl'],
      role: json['role'],
      createdAt: json['createdAt'],
      location: json['location'],
      isAvailable: json['isAvailable'],
      vehicleInfo: json['vehicleInfo'] != null
          ? VehicleInfo.fromJson(Map<String, dynamic>.from(json['vehicleInfo']))
          : null,
      rating: (json['rating'] != null) ? json['rating'].toDouble() : null,
      totalTrips: json['totalTrips'],
    );
  }

  // Convert to Firestore
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'photoUrl': photoUrl,
      'role': role,
      'createdAt': createdAt,
      'location': location,
      'isAvailable': isAvailable,
      'vehicleInfo': vehicleInfo?.toJson(),
      'rating': rating,
      'totalTrips': totalTrips,
    };
  }

  // For modifying fields easily
  AppUser copyWith({
    String? name,
    String? email,
    String? phone,
    String? photoUrl,
    String? role,
    String? createdAt,
    GeoPoint? location,
    bool? isAvailable,
    VehicleInfo? vehicleInfo,
    double? rating,
    int? totalTrips,
  }) {
    return AppUser(
      uid: uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      location: location ?? this.location,
      isAvailable: isAvailable ?? this.isAvailable,
      vehicleInfo: vehicleInfo ?? this.vehicleInfo,
      rating: rating ?? this.rating,
      totalTrips: totalTrips ?? this.totalTrips,
    );
  }

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(
      uid: user.uid,
      name: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
      phone: user.phoneNumber,
      role: 'rider',
      rating: 0.0,
      totalTrips: 0,
      isAvailable: false,
      vehicleInfo: null,
      location: null,
      createdAt: DateTime.now().toIso8601String(),
    );
  }
}
