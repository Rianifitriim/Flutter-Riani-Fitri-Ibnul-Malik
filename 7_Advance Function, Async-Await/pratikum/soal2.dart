void main() async {
  //elemen
  var Herbivora = [
    ['kelinci', 'kambing', 'kuda'],
    ['sapi', 'kedelai', 'kancil']
  ];
  var Karnivora = [
    ['kucing', 'macan', 'beruang'],
    ['harimau', 'singa', 'buaya']
  ];
  var Omnivora = [
    ['hiu', 'babi', 'rakun'],
    ['ayam', 'tikus', 'monyet']
  ];

  Map<String, List> kumpulanHewan = {
    'Hewan1': Herbivora,
    'Hewan2': Karnivora,
    'Hewan3': Omnivora
  };

  print(kumpulanHewan['Hewan1']?[0]);
}
