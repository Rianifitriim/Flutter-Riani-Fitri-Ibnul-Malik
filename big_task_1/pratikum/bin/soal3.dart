import "dart:io";

void main() {
  stdout.write("masukkan nilai : ");
  int i, j, k, n = int.parse(stdin.readLineSync()!);
  for (i = 0; i <= n - 1; i++) {
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (k = i; k <= n - 1; k++) {
      stdout.write("*" + " ");
    }
    stdout.writeln("");
  }
  for (i = n - 1; i >= 0; i--) {
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (k = i; k <= n - 1; k++) {
      stdout.write("*" + " ");
    }
    stdout.writeln("");
  }
}
