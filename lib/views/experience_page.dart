import 'package:flutter/material.dart';

import '../utils/texts.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 130, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.boldText("My Experience", 24),
          const SizedBox(
            height: 20,
          ),
          AppTexts.normalText("Freelance 2024 - Present", 22),
          AppTexts.normalText("Flutter", 22),
          AppTexts.normalText(" - Timeable Application", 22),
          AppTexts.normalText("Connect api to UI and orchestrate app functionality in MVC using Getx.", 22),
          const SizedBox(
            height: 10,
          ),
          AppTexts.normalText(" - Education Application", 22),
          AppTexts.normalText("Connect api to UI and orchestrate app functionality in MVC using Getx.", 22),
          const SizedBox(
            height: 20,
          ),
          AppTexts.normalText("Full stack developer 2023 - 2024", 22),
          AppTexts.normalText("Agilesoft Corporation Co.,Ltd. (Chanthaburi)", 22),
          AppTexts.normalText("Flutter : Prachakij, ChangPMS, PMS Service, PMG Service", 22),
          AppTexts.normalText("React : Web admin PMG", 22),
          AppTexts.normalText("VueJS : Web admin PMS", 22),
          AppTexts.normalText("Built RESTful APIs using NodeJS", 22),
        ],
      ),
    );
  }
}
