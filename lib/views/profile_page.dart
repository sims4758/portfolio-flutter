import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/profile_controller.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/texts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final profileCtl = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 80, 18, 0),
      // alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ClipOval(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    StreamBuilder(
                        stream: profileCtl.getUsersStream(),
                        builder: (context, snapshot){
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                  strokeWidth: 8,
                                  strokeCap: StrokeCap.round,
                                )
                            );
                          }
                          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                            return const Icon(Icons.person_2_rounded, color: AppColors.primaryColor); // แสดง error icon หากโหลดภาพไม่สำเร็จ
                          }
                          return Image.network(
                            snapshot.data!.docs[0]["picture"],
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child; // แสดงภาพเมื่อโหลดเสร็จ
                              }
                              return const CircularProgressIndicator(
                                color: AppColors.primaryColor,
                                strokeWidth: 8,
                                strokeCap: StrokeCap.round,
                              ); // แสดง loading ขณะโหลด
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.person_2_rounded, color: AppColors.primaryColor); // แสดง error icon หากโหลดภาพไม่สำเร็จ
                            },
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 50,
          ),
          AppTexts.boldText("Hi !", 24),
          AppTexts.normalText("My name is Kachanan Jaiboon", 22),
          AppTexts.normalText("Age : ${profileCtl.age.value}", 22),
          AppTexts.normalText("i have experience in application dev and always to develop new skills.", 22),
          const SizedBox(
            height: 50,
          ),
          AppTexts.boldText("Education", 24),
          AppTexts.normalText("Bechelor's Degree", 24),
          AppTexts.normalText("RAMBHAI BARNI RAJABHAT UNIVERSITY", 22),
          AppTexts.normalText("Business Computer 2018 - 2021", 22),
          const SizedBox(
            height: 10,
          ),
          AppTexts.normalText("High School Education", 24),
          AppTexts.normalText("Benchamarachuthit Chanthaburi School", 22),
          AppTexts.normalText("Art-Math 2012 - 2017", 22),
        ],
      ),
    );
  }
}
