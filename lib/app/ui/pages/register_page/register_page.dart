
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/register_controller.dart';
import '../../../routes/app_pages.dart';


class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 31, 55),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topRight,
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration( image: DecorationImage(image: AssetImage("assets/arkaplan.png"), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.only(left: 6.h, right: 6.h, top: 30.h),
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text("JOIN US!",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 3.h,
                      ),
                      
                  SizedBox(
                    height: 3.h,
                  ),
                  // ---------- EMAİL TEXTFİELD ---------
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.mailController,
                    style: TextStyle(
                        fontSize: 18, height: 0.15.h, color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      isDense: false,
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          bottom: 0, top: 0, left: 2.h, right: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Email',
                      fillColor: Color(0xff7c43bd).withOpacity(0.6),
                      labelStyle:
                          TextStyle(color: Colors.grey.shade700, fontSize: 15),
                    ),
                    validator: (value) {
                      if (!EmailValidator.validate(value!)) {
                        return 'Geçerli bir mail giriniz';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                 // ---------- PASSWORD TEXTFİELD ---------
                  TextFormField(
                    obscureText: true,
                    controller: controller.passController,
                    style: TextStyle(
                        fontSize: 18, height: 0.15.h, color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      isDense: false,
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          bottom: 0, top: 0, left: 2.h, right: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Password',
                      fillColor: Color(0xff7c43bd).withOpacity(0.5),
                      labelStyle:
                          TextStyle(color: Colors.grey.shade700, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                 // ---------- REGISTER BUTTON ---------
                 Center(
                   child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff7c43bd),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            controller.authService.createUser(
                                controller.mailController.text,
                                controller.passController.text);
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: Text("    REGISTER    ")),
                 ),
                        SizedBox(
                height: 3.h,
              ),
             
              
           
                    ],
                  ),
            ),
          ),
        ),
        
      ),
    );
  }
}
  