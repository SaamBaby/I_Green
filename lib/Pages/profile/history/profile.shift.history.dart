import 'package:Quete/Utils/Widgets/shift.history.card.dart';
import 'package:Quete/Utils/Widgets/shifts/activities.line.chart.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShiftStats extends StatefulWidget {
  @override
  _ShiftStatsState createState() => _ShiftStatsState();
}

class _ShiftStatsState extends State<ShiftStats> {
  @override
  Widget build(BuildContext context) {
    final _availableShifts =
        Provider.of<ActivityService>(context).getCompletedActivities();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.my_library_books_rounded,
                size: 18,
                color: Colors.black,
              ))
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Monthly",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: "Futura Book",
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(.8),
                  fontSize: 14),
            ),
            Text(
              "Attendance",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: "Futura Heavy",
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(.8),
                  fontSize: 30),
            ),
          ],
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total hours so far",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Book",
                              letterSpacing: 1.2,
                              height: 1.5,
                              color: Colors.black.withOpacity(.4),
                              fontSize: 12),
                        ),
                        Text(
                          "38:24:00",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Heavy",
                              letterSpacing: 1.2,
                              height: 1.5,
                              color: Colors.black.withOpacity(.8),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total hours so far",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Book",
                              letterSpacing: 1.2,
                              height: 1.5,
                              color: Colors.black.withOpacity(.4),
                              fontSize: 12),
                        ),
                        Text(
                          "38:24:00",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Heavy",
                              letterSpacing: 1.2,
                              height: 1.5,
                              color: Colors.black.withOpacity(.8),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .43,
                  child: AttendanceChart()),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "My Activity ",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Heavy",
                          letterSpacing: 1.2,
                          height: 1.5,
                          color: Colors.black.withOpacity(.8),
                          fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Last week  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Book",
                              letterSpacing: 1,
                              color: Colors.black.withOpacity(.5),
                              fontSize: 12),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.black.withOpacity(.5),
                            size: 14,
                          ),
                        )
                      ]),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              (_availableShifts.length != 0)
                  ? Container(
                      margin: EdgeInsets.only(top: 0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _availableShifts.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ShiftHistoryCard(
                                activityId: _availableShifts[index].activityId,
                                shiftStartTime:
                                    _availableShifts[index].shiftStarttime,
                                shiftEndTime:
                                    _availableShifts[index].shiftEndtime,
                                shiftName:
                                    _availableShifts[index].shift.shiftName,
                                totalHours: _availableShifts[index].totalHours,
                              )),
                    )
                  : Center(
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/Schedule/noData.png',
                                height: 240.0,
                                width: 240.0,
                              ),
                              Text("No recent activities")
                            ],
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
