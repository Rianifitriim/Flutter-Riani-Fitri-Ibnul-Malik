void main() async {
  //elemen
  var Herbivora = [
    ['kelinci', 'kambing', 'kuda'],
    ['sapi', 'kedelai', 'kancil']
  ];

  Map<String, List> kumpulanHewan = {'Hewan': Herbivora};

  print(kumpulanHewan['Hewan']?[0]);
}
