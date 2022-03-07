class Hewan {
  List<int> Berat = [10, 20, 30, 40];
}

class Mobil {
  List<String> muatan = ['anj', 'kuda', 'kucing', 'sapi'];

  void tambahMuatan() {
    int jumlahMuatan = muatan.length;
    int kapasitas = 4;

    if (jumlahMuatan >= kapasitas) {
      print('kapasitas sudah penuh');
    } else {
      muatan.add('kucing');
    }
    print(muatan);
  }
}

void main() {
  var ds = Mobil();
  print(ds);
}
