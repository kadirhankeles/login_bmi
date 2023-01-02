import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FireStoreSevice extends GetxService {
  Future<FireStoreSevice> init() async {
    return this;
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  void addUserBmi(double ortalama) {
    db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid).collection("data").doc(DateTime.now().toString()).set({"bmi": ortalama});
  }
        
}
