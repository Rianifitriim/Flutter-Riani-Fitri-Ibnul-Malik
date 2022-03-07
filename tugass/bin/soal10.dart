//hasil dari program tersebut
//i like pasta with tomatoes
void main() {
  final text = 'i like pizza';
  const topping = 'with tomatoes';
  var favorite = '$text $topping';
  String newText = favorite.replaceAll('pizza', 'pasta');
  favorite = 'now i like curry';
  print(newText);
}
// text menggunakan final karena final dapat dirubah atau di replace menjadi kata baru
// topping menggunakan cost karna teks didalamnya tidak dapat diubah maupun di replace
// favorite menggunakan var agar dapat lebih fleksibel menggunakan int atau string
