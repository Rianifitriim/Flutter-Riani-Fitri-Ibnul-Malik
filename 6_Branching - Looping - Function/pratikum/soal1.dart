void main() {
  print(raport(90));
}

raport(nilai) {
  if (nilai > 70) {
    return "A";
  } else if (nilai > 40) {
    return "B";
  } else if (nilai > 0) {
    return "C";
  } else {
    return " ";
  }
}
