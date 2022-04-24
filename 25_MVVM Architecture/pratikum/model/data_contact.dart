class DataContact {
  int id;
  String name;
  String phone;

  DataContact({
    required this.id,
    required this.name,
    required this.phone,
  });

  DataContact.fromJson(Map map)
      : id = map['id'] as int,
        name = map['name'],
        phone = map['phone'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}
