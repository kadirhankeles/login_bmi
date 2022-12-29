import 'package:get/get.dart';
import 'package:login_bmi/app/ui/pages/login_page/login_page.dart';

import '../bindings/login_binding.dart';

part 'app_routes.dart';
class AppPages{
  AppPages();
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: Paths.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    //GetPage(name: Paths.REGISTER, page: () =>  RegisterScreen(), binding: RegisterBinding()),
    //GetPage(name: Paths.HOME, page: () =>  HomeScreen(), binding: HomeBinding()),
    //GetPage(name: Paths.NEWTEXT, page: () =>  NewTextScreen(), binding: NewTextBinding()),
    
  ];

}