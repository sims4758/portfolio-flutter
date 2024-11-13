import 'package:get/get.dart';
import 'package:portfolio/views/contact_us_page.dart';
import 'package:portfolio/views/experience_page.dart';
import 'package:portfolio/views/profile_page.dart';
import 'package:portfolio/views/skill_page.dart';

class NavigateController extends GetxController {
  RxInt selectionIndex = 0.obs;

  final screen = [
    const ProfilePage(),
    const SkillPage(),
    const ExperiencePage(),
    const ContactUsPage()
  ];
}