import 'dart:io';

class Hewan {
  Map<String, int> Berat = {'kucing': 2, 'anjing': 4};
}

class Mobil {
  List muatan = [20, 10, 20];
  void tambahMuatan(int? beban) {
    muatan.add(beban!);
  }

  int totalMuatan() {
    int? total = 0;
    for (var i = 0; i < muatan.length; i++) {
      total = total + muatan[i];
    }
    print('total = $total');
    return total;
  }
}

void main() {
  var hewan = Hewan();
  var kendaraan = Mobil();

  var kapasitasInput = 500;

  print('masukkan : ');
  String? inputHewan = stdin.readLineSync();

  int? coba = hewan.Berat[inputHewan];

  if (kendaraan.totalMuatan() < kapasitasInput) {
    kendaraan.tambahMuatan(coba);
    print(kendaraan.muatan);
  } else {
    print('kapasitas berlebih');
  }
}
