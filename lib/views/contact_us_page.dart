import 'package:flutter/material.dart';

import '../utils/texts.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 130, 18, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.boldText("My Contact", 24),
          const SizedBox(
            height: 20,
          ),
          AppTexts.normalText("PHONE NUMBER : 064-7832303", 22),
          const SizedBox(
            height: 10,
          ),
          AppTexts.normalText("EMAIL : kachanan.kcn@gmail.com", 22),
          const Spacer(),
          Center(
            child: Column(
              children: [
                AppTexts.normalText("Thank you for watching", 22),
                AppTexts.normalText("My resume application format.", 22),
              ],
            ),
          )
        ],
      ),
    );
  }
}
