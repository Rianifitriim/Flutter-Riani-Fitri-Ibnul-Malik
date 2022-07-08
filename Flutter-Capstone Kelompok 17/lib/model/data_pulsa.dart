class DataPulsa {
  String? timestamp;
  String? message;
  List<Data>? data;

  DataPulsa({this.timestamp, this.message, this.data});

  DataPulsa.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? productName;
  int? denom;
  String? category;
  String? descriptions;
  int? points;
  int? stock;
  String? image;

  Data(
      {this.id,
      this.productName,
      this.denom,
      this.category,
      this.descriptions,
      this.points,
      this.stock,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    denom = json['denom'];
    category = json['category'];
    descriptions = json['descriptions'];
    points = json['points'];
    stock = json['stock'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['denom'] = this.denom;
    data['category'] = this.category;
    data['descriptions'] = this.descriptions;
    data['points'] = this.points;
    data['stock'] = this.stock;
    data['image'] = this.image;
    return data;
  }
}
