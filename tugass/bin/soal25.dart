void main() async {
  await fetchUserData();
  print('hello');
}

Future<void> fetchUserData() async {
  return Future.delayed(
      Duration(seconds: 1), () => print('data berhasil di dapatkan'));
}
