
import 'dart:io';

class RegistrationUser {
  String? name;
  String? email;
  String? password;
  File? profileImage;

  RegistrationUser(
      {this.name = "", this.email = "", this.password = "", this.profileImage});
}
