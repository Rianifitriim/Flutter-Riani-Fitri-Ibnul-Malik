class DataContact {
  String? name;
  String? number;

  DataContact({
    this.name,
    this.number,
  });

  DataContact.fromJson(Map map)
      : name = map['name'],
        number = map['number'];

  Map toJson() {
    return {
      'name': name,
      'number': number,
    };
  }
}
