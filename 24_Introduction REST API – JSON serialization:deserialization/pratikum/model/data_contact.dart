class DataContact {
  String? name;
  String? phone;

  DataContact({
    this.name,
    this.phone,
  });

  DataContact.fromJson(Map map)
      : name = map['name'],
        phone = map['phone'];

  Map toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }
}
