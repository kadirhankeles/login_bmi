import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Color(0xff6E34F0),
        body: Stack(
          children: [
            Positioned(
              top: 5.h,
              right: 28.h,
              child: Container(
                  height: 20.h,
                  child: Image(
                    image: AssetImage("assets/baloncuk1.png"),
                    color: Color(0xffE6D9FA).withOpacity(.7),
                  )),
            ),
            Positioned(
              top: 35.h,
              left: 35.h,
              child: Container(
                  height: 20.h,
                  child: Image(
                    image: AssetImage("assets/baloncuk2.png"),
                    color: Color(0xffE6D9FA).withOpacity(.7),
                  )),
            ),
            Positioned(
              top: 65.h,
              right: 35.h,
              child: Container(
                  height: 20.h,
                  child: Image(
                    image: AssetImage("assets/baloncuk3.png"),
                    color: Color(0xffE6D9FA),
                  )),
            ),
            Positioned(
                top: 20.h,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.h, right: 6.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(height: 20.h ,child: Image(image: AssetImage("assets/logo.png"))),
                        SizedBox(height: 6.h,),
                        //--------Boyun girildiği TextField--------
                        TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.heightController,
                          style: TextStyle(
                              fontSize: 18,
                              height: 0.15.h,
                              color: Colors.white),
                          decoration: InputDecoration(
                            isDense: false,
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 0, top: 0, left: 2.h, right: 2.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Height',
                            suffixText: "CM",
                            fillColor: Color(0xff7c43bd).withOpacity(0.6),
                            suffixStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(
                                color: Colors.grey.shade700, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        //--------Kilonun girildiği TextField--------
                        TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.weightController,
                          style: TextStyle(
                              fontSize: 18,
                              height: 0.15.h,
                              color: Colors.white),
                          decoration: InputDecoration(
                            isDense: false,
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 0, top: 0, left: 2.h, right: 2.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Weight',
                            suffixText: "KG",
                            suffixStyle: TextStyle(color: Colors.white),
                            fillColor: Color(0xff7c43bd).withOpacity(0.6),
                            labelStyle: TextStyle(
                                color: Colors.grey.shade700, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        //--------Calculate Butonu--------
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff7c43bd),
                              shape: StadiumBorder(),
                            ),
                            onPressed: () {
                              if(controller.heightController.text.isEmpty || controller.weightController.text.isEmpty ){
                                  Get.snackbar("Enter value", "Please enter values ​​in the relevant fields.");
                              }else{
                                if((double.parse(controller.heightController.text) > 50 && double.parse(controller.heightController.text) <= 220) && (double.parse(controller.weightController.text) > 0  && double.parse(controller.weightController.text) <= 300)){
                                   controller.getDialog(double.parse(controller.heightController.text), double.parse(controller.weightController.text));
                                } else{
                                  Get.snackbar("Check the values", "Check and correct the entered values");
                                }
                              }
                             
                              // controller.auth.loginUser(controller.mailController.text, controller.passController.text);
                            },
                            child: Text("        CALCULATE        ")),
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
