import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SkillsController extends GetxController {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getSkillsStream() {
    return firestore.collection('skill').snapshots();
  }
}