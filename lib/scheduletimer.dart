import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler/apputil.dart';
import 'package:scheduler/landingpage.dart';

class Scheduler extends StatelessWidget {
  Scheduler({super.key});

  RxList<Map<String, dynamic>> schedules = [
    {
      "day": "SUN",
      "key": "Sunday",
      "active": true,
      "available": [
        {"time": "Morning", "status": false},
        {"time": "Afternoon", "status": false},
        {"time": "Evening", "status": false}
      ]
    },
    {
      "day": "MON",
      "key": "Monday",
      "active": true,
      "available": [
        {"time": "Morning", "status": false},
        {"time": "Afternoon", "status": false},
        {"time": "Evening", "status": false}
      ]
    },
    {
      "day": "TUE",
      "key": "Tuesday",
      "active": true,
      "available": [
        {"time": "Morning", "status": false},
        {"time": "Afternoon", "status": false},
        {"time": "Evening", "status": false}
      ]
    },
    {
      "day": "WED",
      "key": "Wednesday",
      "active": true,
      "available": [
        {"time": "Morning", "status": false},
        {"time": "Afternoon", "status": false},
        {"time": "Evening", "status": false}
      ]
    },
    {
      "day": "THU",
      "key": "Thursday",
      "active": true,
      "available": [
        {"time": "Morning", "status": false},
        {"time": "Afternoon", "status": false},
        {"time": "Evening", "status": false}
      ]
    },
    {
      "day": "FRI",
      "key": "Friday",
      "active": true,
      "available": [
        {"time": "Morning", "status": false},
        {"time": "Afternoon", "status": false},
        {"time": "Evening", "status": false}
      ]
    },
    {
      "day": "SAT",
      "key": "Saturday",
      "active": true,
      "available": [
        {"time": "Morning", "status": false},
        {"time": "Afternoon", "status": false},
        {"time": "Evening", "status": false}
      ]
    }
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppUtil.primaryclr,
        title: Text(
          "Schedule Time",
          style: AppUtil.appBarheading,
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                child: Text(
                  "Set your Weekly Hours",
                  style: AppUtil.heading1,
                ),
              ),
            ],
          ),
          Obx(() {
            return 1 == 1
                ? ListView.separated(
                    shrinkWrap: true,
                    itemCount: schedules.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Row(
                        mainAxisAlignment: schedules[index]["active"]
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 85,
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.green,
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  value: schedules[index]["active"],
                                  onChanged: (bool? value) {
                                    var a = schedules.value;

                                    a[index]["active"] = value;
                                    log(a[index]["active"].toString());

                                    schedules.value = a;
                                    schedules.refresh();

                                    log(schedules[1].toString());
                                  },
                                ),
                                Text(
                                  schedules[index]['day'].toString(),
                                  style: AppUtil.weekdays,
                                ),
                              ],
                            ),
                          ),
                          schedules[index]["active"]
                              ? Expanded(
                                  child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      schedules[index]["available"]!.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return InkWell(
                                      onTap: () {
                                        schedules[index]["available"][i]
                                                ["status"] =
                                            !schedules[index]["available"][i]
                                                ["status"];
                                        schedules.refresh();
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: schedules[index]
                                                            ["available"][i]
                                                        ["status"]
                                                    ? AppUtil.primaryclr
                                                    : AppUtil.secndaryclr,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Center(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                    schedules[index][
                                                                'available']![i]
                                                            ["time"]
                                                        .toString(),
                                                    style: schedules[index]
                                                                ["available"][i]
                                                            ["status"]
                                                        ? AppUtil.enabledtimes
                                                        : AppUtil
                                                            .disabledtimes)),
                                          )),
                                    );
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 10,
                                    crossAxisSpacing: 5,
                                    mainAxisExtent: 30,
                                  ),
                                )
                                  //                         :

                                  )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "Unavailabe",
                                    style: AppUtil.disabledtimes,
                                  ),
                                )
                        ],
                      ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      );
                    })
                : Container();
          }),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 20, top: 15),
            child: InkWell(
              onTap: () {
                save();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppUtil.primaryclr),
                child: Center(
                  child: Text(
                    "Save",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  save() async {
    String result = "Hi ,You are available in ";
    int d = 0;
    for (int i = 0; i < schedules.length; i++) {
      int c = 0;
      String a = "";
      if (schedules[i]["active"] == true)
        // ignore: curly_braces_in_flow_control_structures
        for (int index = 0; index < schedules[i]["available"].length; index++) {
          if (schedules[i]["available"][index]["status"] == true) {
            c = c + 1;

            a = a + schedules[i]["available"][index]["time"];
            if (c == 1) {
              a = "$a & ";
            } else {
              a = "$a , ";
            }

            log(c.toString());
          }
        }
      log(a);
      if (a.isNotEmpty) {
        print(a);
        if (c == 1) a = a.replaceAll(" &", ",");
      }
      log(a);
      if (c == 3) {
        d = 1;
        result = "${result + schedules[i]["key"]} ";
        result = "${result}Whole day ,";
      } else if (c == 1) {
        d = 1;
        result = "${result + schedules[i]["key"]}  ";
        result = result + a;
      } else if (c == 2) {
        d = 1;
        result = "${result + schedules[i]["key"]} ";
        result = result + a;
      }
    }
    if (d == 0) {
      result = 'Uavailable';
    }
    result = result.replaceFirst(",", ".", result.length - 2);

    Get.offAll(LandingPage(result: result));
  }
}
