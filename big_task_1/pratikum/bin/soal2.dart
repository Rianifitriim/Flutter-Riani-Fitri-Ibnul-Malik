import 'dart:io';

int azimuth(int angka) {
  int a = 0;
  if (angka > 180) {
    a = angka - 180; // jika return lebih dari 180 maka return masukkan -180
  } else if (angka < 180) {
    a = angka + 180; // jika return kurang dari 180 maka return masukkan +180
  }
  if (a <= 0 || a >= 360) {
    return 0; // jika return lebih dari 360 atau kurang dari sama dengan0 maka return masukkan 0
  }
  return a;
}

void main() {
  stdout.write("masukkan angka : ");
  int angka = int.parse(stdin.readLineSync()!);
  print(azimuth(angka));
}
