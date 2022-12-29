import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_bmi/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 2, 31, 55),

        ),
       
      );
      },
            maxTabletWidth: 900, // Optional

    );
  }
}


