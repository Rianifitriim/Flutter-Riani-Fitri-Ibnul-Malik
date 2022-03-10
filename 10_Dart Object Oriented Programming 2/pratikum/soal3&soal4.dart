class Matematika {
  hasil(x, y) {}
}

class KelipatanPersekutuanTerkecil implements Matematika {
  @override
  hasil(x, y) {
    int i = x > y ? x : y;
    while (true) {
      if (i % x == 0 && i % y == 0) {
        return i;
      }
      i++;
    }
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  @override
  hasil(x, y) {
    if (y == 0) {
      return x;
    } else {
      return hasil(y, x % y);
    }
  }
}

void main() {
  var kpk = KelipatanPersekutuanTerkecil();
  print('Hasil dari KPK x dan y adalah : ');
  print(kpk.hasil(18, 38));

  var fpb = FaktorPersekutuanTerbesar();
  print('Hasil dari FPB x dan y adalah : ');
  print(fpb.hasil(6, 10));
}
