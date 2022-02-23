void main() {
  faktorial(k) {
    double angka = 1;
    double faktor = 1;
    while (angka <= k) {
      faktor = faktor * angka;
      angka = angka + 1;
    }
    print(faktor);
  }

  print("ini adalah faktorial dari 10, 20 dan 30 : ");
  faktorial(10);
  faktorial(20);
  faktorial(30);
}
