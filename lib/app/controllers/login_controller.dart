
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_bmi/shared/service/auth_service.dart';

class LoginController extends GetxController {
  AuthService authService = AuthService();
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
}
  