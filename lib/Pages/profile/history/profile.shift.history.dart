import 'package:Quete/Utils/Widgets/shift.history.card.dart';
import 'package:Quete/Utils/Widgets/shifts/activities.line.chart.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShiftHistory extends StatefulWidget {
  @override
  _ShiftHistoryState createState() => _ShiftHistoryState();
}

class _ShiftHistoryState extends State<ShiftHistory> {
  List<FlSpot> spotData = [FlSpot(0, 0)];
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();
  }

  double formatChartTotalHours(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var minutes = ((secs % 3600) ~/ 60) / 60;
    var hours = (secs ~/ 3600);
    return double.parse((hours + minutes).toStringAsFixed(2));
  }

  String formatTotalHours(double milliseconds) {
    var secs = milliseconds ~/ 1000;
    var seconds = (secs % 60).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final _availableShifts =
        Provider.of<ActivityService>(context).getCompletedActivities();
    List<FlSpot> createGraphPlot() {
      _availableShifts.forEach((element) {
        switch (
            DateTime.now().day - (DateTime.parse(element.shiftStarttime).day)) {
          case 1:
            return spotData
                .add(FlSpot(7, formatChartTotalHours(element.totalHours)));
          case 2:
            return spotData
                .add(FlSpot(6, formatChartTotalHours(element.totalHours)));
          case 3:
            return spotData
                .add(FlSpot(5, formatChartTotalHours(element.totalHours)));
          case 4:
            return spotData
                .add(FlSpot(4, formatChartTotalHours(element.totalHours)));
          case 5:
            return spotData
                .add(FlSpot(3, formatChartTotalHours(element.totalHours)));
          case 6:
            return spotData
                .add(FlSpot(2, formatChartTotalHours(element.totalHours)));
          case 7:
            return spotData
                .add(FlSpot(1, formatChartTotalHours(element.totalHours)));
          default:
            setState(() {
              isEmpty = true;
            });
            return spotData.add(FlSpot(0, 0));
        }
      });
      return spotData;
    }

    double getTotalHours() {
      double total = 0;
      _availableShifts.forEach((e) {
        total += e.totalHours;
      });
      return total;
    }

    int getTotalDays() {
      int total = 0;
      _availableShifts.forEach((e) {
        total += 1;
      });
      return total;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                print(createGraphPlot().first.y);
              },
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                          formatTotalHours(getTotalHours()),
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
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total days worked",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Book",
                                letterSpacing: 1.2,
                                height: 1.5,
                                color: Colors.black.withOpacity(.4),
                                fontSize: 12),
                          ),
                          Text(
                            getTotalDays().toString(),
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
              (!isEmpty)
                  ? Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .43,
                      child: AttendanceChart(spotData: createGraphPlot()))
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
                              Text(
                                "No shifts on last week",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Futura Book",
                                    letterSpacing: 1,
                                    height: 1.5,
                                    color: Colors.black.withOpacity(.8),
                                    fontSize: 12),
                              )
                            ],
                          )),
                    ),
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
                          text: "Ascending order",
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
