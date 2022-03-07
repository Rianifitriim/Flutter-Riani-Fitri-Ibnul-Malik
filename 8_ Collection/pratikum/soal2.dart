void main() async {
  //elemen
  var herbivora = [
    ['kelinci', 'jantan'],
    ['sapi', 'betina']
  ];

  var map = {};

  for (var key in herbivora) {
    for (var value in key) {
      map[key[0]] = value;
    }
  }
  print(map);
}
