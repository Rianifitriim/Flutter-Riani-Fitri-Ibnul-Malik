import 'dart:io';

ganjilGenap() {
  stdout.write("masukkan nilai : ");
  int nilai = int.parse(stdin.readLineSync()!);
  if (nilai % 2 == 0) {
    return true;
  } else {
    return false;
  }
}

void main() {
  print(ganjilGenap());
}
