import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:scheduler/apputil.dart';
import 'package:scheduler/scheduletimer.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key, required this.result}) : super(key: key);
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          child: Center(
            child: Text(
              "Home Page",
              style: AppUtil.appBarheading,
            ),
          ),
        ),
        backgroundColor: AppUtil.primaryclr,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                result.toString(),
                style: AppUtil.disabledtimes,
              ),
            ),
            SizedBox(
              height: Get.height / 4,
            ),
            TextButton(
                onPressed: () {
                  Get.to(Scheduler());
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: AppUtil.primaryclr,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "Add Schedule",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
