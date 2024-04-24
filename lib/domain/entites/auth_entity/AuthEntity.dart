import 'UserEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed907798@gmail.com"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2Mjg3N2ZhMzIwNTE2MDI3NzhmYTk2ZiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEzOTI4MTg3LCJleHAiOjE3MjE3MDQxODd9.WzXwNRutiM8miQuy4hFq0q8lyxz3QqPQVt7L_Pr9vpQ"

class AuthEntity {
  AuthEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  UserEntity? user;
  String? token;



}