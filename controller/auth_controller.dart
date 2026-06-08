import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLogged = false.obs;

  void login() {
    isLogged.value = true;
  }

  void logout() {
    isLogged.value = false;
  }
}
