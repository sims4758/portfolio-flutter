import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/navigation_controller.dart';
import 'package:portfolio/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final navigateCtl = Get.put(NavigateController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: NavigationBar(
          backgroundColor: AppColors.secondaryColor,
          shadowColor: AppColors.secondaryColor,
          selectedIndex: navigateCtl.selectionIndex.value,
          onDestinationSelected: (index){
            navigateCtl.selectionIndex.value = index;
          },

          destinations: const [
            NavigationDestination(icon: Icon(Icons.account_circle_outlined), label: "Profile"),
            NavigationDestination(icon: Icon(Icons.code), label: "Skill"),
            NavigationDestination(icon: Icon(Icons.business_center_outlined), label: "Experience"),
            NavigationDestination(icon: Icon(Icons.contact_page_outlined), label: "Contact"),
          ],
        ),
        body: navigateCtl.screen[navigateCtl.selectionIndex.value],
      ),
    );
  }
}
