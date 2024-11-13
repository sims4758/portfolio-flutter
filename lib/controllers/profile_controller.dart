import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    DateTime birthDate = DateTime(2000, 6, 16);
    calculateAge(birthDate);
    super.onInit();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxInt age = 0.obs;
  RxInt birth = 2000.obs;

  void calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      years -= 1;
    }

    age.value = years;
  }

  Stream<QuerySnapshot> getUsersStream() {
    return firestore.collection('profile').snapshots();
  }
}