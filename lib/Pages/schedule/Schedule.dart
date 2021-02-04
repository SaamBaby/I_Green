import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
    CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${DateTime.now().day} ',
                            style: TextStyle(
                                fontFamily: 'Futura Heavy',
                                color: Color(0xffff6e6e).withOpacity(.8),
                                fontSize: 100,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${(DateFormat('EE . MMMM . yyyy').format(DateTime.now()))}',
                            style: TextStyle(
                                fontFamily: 'Futura Book',
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Colors.lightBlue.shade300,
                                  ),
                                ),
                                TextSpan(
                                  text: "  ",
                                ),
                                TextSpan(
                                  text: "Total upcoming plans",
                                  style: TextStyle(
                                      fontFamily: 'Futura Book',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Color(0xffff6e6e),
                                  ),
                                ),
                                TextSpan(
                                  text: "  ",
                                ),
                                TextSpan(
                                  text: "Total upcoming plans",
                                  style: TextStyle(
                                      fontFamily: 'Futura Book',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Colors.purpleAccent.shade200,
                                  ),
                                ),
                                TextSpan(
                                  text: "  ",
                                ),
                                TextSpan(
                                  text: "Total upcoming plans",
                                  style: TextStyle(
                                      fontFamily: 'Futura Book',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin: EdgeInsets.only(right: 15),
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff6f7cd1).withOpacity(.8)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, ",
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Futura Book',
                                      color: Colors.white.withOpacity(.8),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Icon(
                                Icons.play_circle_filled,
                                size: 17,
                                color: Colors.white,
                              ),
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin: EdgeInsets.only(right: 15),
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xffff6e6e)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, ",
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Futura Book',
                                      color: Colors.white.withOpacity(.8),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Icon(
                                Icons.play_circle_filled,
                                size: 17,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            TableCalendar(
              calendarStyle: CalendarStyle(
                  selectedColor: Color(0xffff6e6e).withOpacity(.8),
                  weekendStyle: TextStyle(color: Color(0xFFffce89))),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Color(0xFFffce89),fontWeight: FontWeight.w900,fontFamily: "Futura Heavy"),
                weekdayStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontFamily: "Futura Heavy"),
              ),
              calendarController: _calendarController,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Events ",
                    style: TextStyle(
                        fontFamily: 'Futura Heavy',
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 20, horizontal: 20),
                padding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: 20),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffeaeaea)),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffeaeaea),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color:Color(0xffff6e6e)),
                          child: Center(
                            child: Text(
                              '${DateTime.now().day} ',
                              style: TextStyle(
                                  fontFamily: 'Futura Heavy',
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${(DateFormat('h:mm a').format(DateTime.now()))}',
                              style: TextStyle(
                                  fontFamily: 'Futura Heavy',
                                  color: Colors.black,
                                  fontSize: 15,
                                  height: 2,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "House Keeping shift ",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 18,
                                  height: 1.4,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              '${(DateFormat('EE . MMMM . yyyy').format(DateTime.now()))}',
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900),
                            ),

                          ],
                        )
                      ],
                    ),

                  ],
                )),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      toolbarHeight: 60,
      leading: Transform.translate(
        offset: Offset(15, 0),
        child: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      title: Text(
        "Today's Plan",
        style: TextStyle(
            fontFamily: 'Futura Heavy',
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 25,
          ),
        ),
      ],
    );
  }
}
