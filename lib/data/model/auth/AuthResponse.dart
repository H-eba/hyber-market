import 'package:ecommerce/domain/entites/auth_entity/AuthEntity.dart';

import 'UserModel.dart';

/// message : "success"
/// statusMsg : ""
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed9078@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2Mjg3NDBmMzIwNTE2MDI3NzhmYTg0OCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEzOTI3MTg0LCJleHAiOjE3MjE3MDMxODR9.ZUWwp1lOAozVRs7radSkpLiLKN-_8As7u9u410pwCyM"

class AuthResponse {
  AuthResponse({
      this.message, 
      this.statusMsg, 
      this.user, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  UserModel? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
AuthEntity toAuthEntity(){
    return AuthEntity(
      message: message,
      token: token,
      user: user?.toUserEntity(),
    );
}
}