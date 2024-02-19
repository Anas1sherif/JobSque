import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Database/Local_Database.dart';

final rootProvider = FutureProvider((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  final bool isFirstTime = await LocalDataBase.getFirstTime();
  if (isFirstTime) {
    return "first-time";
  } else {
    final String? token = await LocalDataBase.getToken();
    if (token == null) {
      return "login-screen";
    } else {
      return "home-screen";
    }
  }
});
