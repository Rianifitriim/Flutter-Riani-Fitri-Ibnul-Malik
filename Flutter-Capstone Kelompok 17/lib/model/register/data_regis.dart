import 'package:json_annotation/json_annotation.dart';

class DataRegis {
  String? email;
  String? username;
  String? password;
  String? name;
  String? address;
  String? phone;

  DataRegis(
      {this.email,
      this.username,
      this.password,
      this.name,
      this.address,
      this.phone});

  DataRegis.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    return data;
  }
}
