class BangunRuang {
  double? panjang;
  double? lebar;
  double? tinggi;

  void volume(double p, double l, double t) {
    panjang = p;
    lebar = l;
    tinggi = t;
  }
}

class Kubus extends BangunRuang {
  double sisi = 0;

  void volumeKubus(double s) {
    sisi = s;
    var volume = s * s * s;
    print('Hasil dari volume kubus adalah :');
    print(volume);
  }
}

class Balok extends BangunRuang {
  @override
  void volume(double p, double l, double t) {
    var hasil = p * l * t;
    print('Hasil dari volume balok adalah : ');
    print(hasil);
  }
}

void main() {
  @override
  var kubus = Kubus();
  kubus.volumeKubus(7);

  @override
  var balok = Balok();
  balok.volume(1, 2, 3);
}
