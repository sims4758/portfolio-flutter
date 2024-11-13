import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/skills_controller.dart';
import 'package:portfolio/utils/colors.dart';

import '../utils/texts.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {

  final skillCtl = Get.put(SkillsController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: skillCtl.getSkillsStream(),
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
            return Center(child: AppTexts.boldText("Data Not found", 24));
          }

          List<DocumentSnapshot> docs = snapshot.data!.docs;
          docs.sort((a, b) {
            int scoreA = int.tryParse(a['score'].toString()) ?? 0;
            int scoreB = int.tryParse(b['score'].toString()) ?? 0;
            return scoreB.compareTo(scoreA);
          });

          return Container(
        padding: const EdgeInsets.fromLTRB(18, 130, 18, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTexts.boldText("My skills", 24),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: ListView.builder(
              padding: EdgeInsets.zero,
                itemCount: docs.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTexts.normalText(docs[index].id.toUpperCase(), 22),
                          progressBar(docs[index]["score"])
                        ],
                      ),
                    ],
                  );
                }))
          ],
        ),
      );
    });
  }

  progressBar(score){
    double progressWidth = (score / 10) * 200;
    return Stack(
      children: [
        Container(
          width: 200,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.backgroundProgressColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
              ),
            ],
          ),
        ),
        Container(
          width: progressWidth,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.progressColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.progressColor.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
        )
      ],
    );
  }
}
