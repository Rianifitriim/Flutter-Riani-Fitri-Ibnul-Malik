import 'dart:io';

ganjilGenap() {
  stdout.write("masukkan nilai : ");
  int nilai = int.parse(stdin.readLineSync()!);
  if (nilai % 2 == 0) {
    return 'genap';
  } else {
    return 'ganjil';
  }
}

void main() {
  print(ganjilGenap());
}
