// no 1
class Hewan {
  List<int> Berat = [10, 20, 30, 40];
}

class Mobil {
  List<String> muatan = ['anj', 'kuda', 'kucing', 'sapi'];

  void tambahMuatan(String hewan) {
    int jumlahMuatan = muatan.length;
    int kapasitas = 5;

    if (jumlahMuatan < kapasitas) {
      muatan.add(hewan);
    } else {
      print('kapasitas penuh');
    }
    print(muatan);
  }

// no 2
  totalMuatan() {
    print(muatan.length);
  }
}

void main() {
  var hewan = Hewan();
  print(hewan);
  var mobil = Mobil();
  mobil.tambahMuatan('babi');
  print('Total muatan yang ada dimobil tersebut adalah : ');
  mobil.totalMuatan();
}
