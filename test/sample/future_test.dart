
main() {
  Future.delayed(const Duration(seconds: 3), () => print('Large Latte'));
  getUserOrder();
  print('Fetching user order...');
}

Future<void> getUserOrder() {
  return Future.delayed(const Duration(seconds: 3), () => print('Large Latte'));
}