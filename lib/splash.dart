import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:scheduler/apputil.dart';
import 'package:scheduler/landingpage.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUtil.primaryclr,
      body: Center(
        child: SizedBox(
          height: 300,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time Scheduler",
                style: GoogleFonts.elMessiri(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 35),
                textAlign: TextAlign.center,
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
              Container(
                child: landingpage(),
              )
            ],
          ),
        ),
      ),
    );
  }

  landingpage() {
    Future.delayed(const Duration(seconds: 4), () async {
      Get.offAll(LandingPage(result: "No Schedule Available"));
    });
  }
}
