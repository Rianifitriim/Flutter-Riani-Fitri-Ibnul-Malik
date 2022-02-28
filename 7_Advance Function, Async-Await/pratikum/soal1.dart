void main() async {
  List<int> nomor = [1, 2, 3];
  int kali = 4;
  print(await fungsi(nomor, kali));
}

Future<List> fungsi(List nomor, int kali) async {
  List hasil = [];
  await Future.delayed(Duration(seconds: 1), () {
    for (int i = 0; i < nomor.length; i++) {
      var coba = nomor[i] * kali;
      hasil.add(coba);
    }
  });
  return hasil;
}
