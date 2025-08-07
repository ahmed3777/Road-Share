import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? photoUrl;
  String? userType;


  AuthUser({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.photoUrl,
    this.userType,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
       uid : json['user_id'] as String? ?? '',
        name: json['user_name'] as String? ?? '',
        email: json['user_email'] as String? ?? '',
        phone: json['user_phone'] as String? ?? '',
        photoUrl: json['user_logo'] as String? ?? '',
        userType: json['user_type'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'user_id': uid,
        'user_name': name,
        'user_email': email,
        'user_phone': phone,
        'user_logo': photoUrl,
        'user_type': userType,
  };
  factory AuthUser.fromFirebaseUser(User user) {
    return AuthUser(
      uid: user.uid,
      name: user.displayName??'',
      email: user.email??'',
      phone: user.phoneNumber ?? '',
      photoUrl: user.photoURL ?? '',
      
    );
  }
}
