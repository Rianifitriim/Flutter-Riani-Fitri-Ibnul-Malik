class RespRegis {
  String? timestamp;
  String? message;
  Data? data;

  RespRegis({this.timestamp, this.message, this.data});

  RespRegis.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? username;
  String? name;
  String? address;
  String? phone;
  int? point;
  String? role;

  Data(
      {this.id,
      this.email,
      this.username,
      this.name,
      this.address,
      this.phone,
      this.point,
      this.role});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    point = json['point'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['point'] = this.point;
    data['role'] = this.role;
    return data;
  }
}
