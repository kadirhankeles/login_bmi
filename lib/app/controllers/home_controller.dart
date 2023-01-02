import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_bmi/app/routes/app_pages.dart';
import 'package:login_bmi/shared/service/firestore_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeController extends GetxController {
  
  double ortalama = 0.0;
  double boy = 0.0;
  double kilo = 0.0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  getDialog(double boy, double kilo) {
    boy = boy / 100;
    ortalama = kilo / (boy * boy);
    Text ortalamaYazisi = Text(
      "${ortalama.toStringAsFixed(2)}",
      style: TextStyle(color: Colors.red),
    );
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 27.h,
          width: 70.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(.7)),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Your BMI is",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                "${ortalama.toStringAsFixed(2)}",
                style: TextStyle(
                    color: yaziRengi(ortalama),
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              Text("This value is in the ${sonucYazisi(ortalama)}"),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 1.h,
                  ),
                  Container(
                    height: 4.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50)),
                    child: GestureDetector(
                      onTap: () {
                        FireStoreSevice().addUserBmi(double.parse(ortalama.toStringAsFixed(2)));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 1.h,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 1.h,
                          ),
                          Text(
                            "Save Data",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 1.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 2.h,),
                  GestureDetector(onTap: () {
                    Get.back();
                  },
                    child: Container(
                      height: 4.h,
                      width: 15.1.h,
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade900,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                          children: [
                            SizedBox(
                              width: 1.h,
                            ),
                            Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            Text(
                              "Recalculate",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                          ],
                        ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  String sonucYazisi(ortalama) {
    if (ortalama < 18.50) {
      return "Underweight";
    } else if (ortalama >= 18.5 && ortalama < 24.9) {
      return "Healthy Weight";
    } else if (ortalama >= 25.0 && ortalama < 29.9) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  Color yaziRengi(ortalama) {
    if (ortalama < 18.50) {
      return Colors.blue;
    } else if (ortalama >= 18.5 && ortalama < 24.9) {
      return Colors.green;
    } else if (ortalama >= 25.0 && ortalama < 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String yasGrubu(yas) {
    if (yas <= 19) {
      return "0-19";
    } else if (yas >= 20 && yas <= 25) {
      return "20-25";
    } else if (yas >= 26 && yas <= 29) {
      return "26-29";
    } else if (yas >= 30 && yas <= 34) {
      return "30-34";
    } else if (yas >= 35 && yas <= 39) {
      return "35-39";
    } else if (yas >= 40 && yas <= 44) {
      return "40-44";
    } else {
      return "45+";
    }
  }
}
