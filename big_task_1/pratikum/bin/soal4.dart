import 'dart:io';

void main() {
  stdout.write("masukkan nilai : ");
  int i, j, n = int.parse(stdin.readLineSync()!);
  for (i = 1; i <= n; i++) {
    for (j = 0; j <= i; j++) {
      if (j == i) {
        stdout.write('$i \n');
      } else {
        stdout.write(' ');
      }
    }
  }
}
