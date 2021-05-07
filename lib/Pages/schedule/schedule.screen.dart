import 'package:Quete/Utils/Widgets/schedule.card.dart';
import 'package:Quete/providers/schedule.shifts.provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:Quete/models/job_shifts.dart';
class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule>with TickerProviderStateMixin {
  CalendarController _calendarController;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
    Future.delayed(Duration.zero).then((value) =>
        Provider.of<ShiftProvider>(context, listen: false)
            .fetchAvailableShifts());
  }

  @override
  void dispose() {
    _calendarController.dispose();
  }
  Map<DateTime, List<ShiftModel>> _groupedEvents;

  _groupEvents(List<ShiftModel> events){
    _groupedEvents={};
    events.forEach((element) {
      DateTime date= DateTime.utc(element.shiftDateTime.year,element.shiftDateTime.month,element.shiftDateTime.day,12);
      _groupedEvents.putIfAbsent(date, () =>_eventstoList(events,element.shiftDateTime));
    });

  }
  List<ShiftModel> _eventstoList(List<ShiftModel> events,DateTime dateTime){
    List<ShiftModel> groupedList=[];
    events.forEach((element) {if(element.shiftDateTime==dateTime){
      groupedList.add(element);
    }});
    return groupedList;
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date) ? Colors.white: _calendarController.isToday(date)
            ? Color(0xFFffffff).withOpacity(.8)
            : Color(0xFF0000000).withOpacity(.8),
      ),
      width: 7,
      height: 7.0,
      child: Center(
        child: Icon(Icons.circle,size: 2,color: _calendarController.isSelected(date) ? Colors.white:Colors.black,)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final loadedAvailableShifts = Provider.of<ShiftProvider>(context);
    _groupEvents(loadedAvailableShifts.itemsList);

    DateTime _selectedDate= _calendarController.selectedDay;
    final _selectedEvents= _groupedEvents[_selectedDate]??[];
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
                  TableCalendar(
                  events:  _groupedEvents,
                    formatAnimation: FormatAnimation.slide,
                    builders: CalendarBuilders(
                     selectedDayBuilder:(context, date, _){
                       return Container(
                         margin: const EdgeInsets.all(4.0),
                         padding: EdgeInsets.all(13),
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Color(0xFF00bf6f).withOpacity(.8),
                         ),

                         width: 50,
                         height: 50,
                         child: Text(
                           '${date.day}',
                           style: TextStyle().copyWith(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w900),

                         ),
                       );
                     },
                      outsideHolidayDayBuilder: (context, date, _){
                        return Container(
                          margin: const EdgeInsets.all(4.0),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF00bf6f).withOpacity(.8),
                          ),

                          width: 50,
                          height: 50,
                          child: Text(
                            '${date.day}',
                            style: TextStyle().copyWith(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w900),

                          ),
                        );
                      },
                      todayDayBuilder: (context, date, _) {
                        return Container(
                          margin: const EdgeInsets.all(4.0),
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF00bf6f),
                          ),

                          width: 50,
                          height: 50,
                          child: Text(
                            '${date.day}',
                            style: TextStyle().copyWith(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w900),

                          ),
                        );
                      },
                      markersBuilder: (context, date, events, holidays) {
                        final children = <Widget>[];

                        if (events.isNotEmpty) {
                          children.add(
                            Positioned(
                              right: 22,
                              bottom: 8,
                              child: _buildEventsMarker(date, events),
                            ),
                          );
                        }

                        return children;
                      },
                    ),
                    calendarStyle: CalendarStyle(
                        todayColor: Color(0xFF00bf6f).withOpacity(.8),
                        weekendStyle: TextStyle(color: Color(0xFFffce89))),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(
                          color: Color(0xFFffce89),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Heavy"),
                      weekdayStyle: TextStyle(
                          color: Color(0xff344644),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Heavy"),
                    ),
                    calendarController: _calendarController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Daily Shifts",
                    style:Theme.of(context).textTheme.headline5
                  ),
                ],
              ),
            ),

            _selectedEvents.length!=0?
            Container(
              margin:EdgeInsets.only(top:0),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:  _selectedEvents.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ChangeNotifierProvider.value(
                        value:  _selectedEvents[index],
                        child: ScheduleCard(),
                      )),
            ):
            Center(
              child: Container(
                  padding:EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                  child: Column(
                children: [
                  Image.asset(
                    'assets/images/Schedule/noData.png',
                    height: 240.0,
                    width: 240.0,

                  ),
                  Text("No Shifts for Today")
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      toolbarHeight: 70,
      title: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Monthly",
                style:  Theme.of(context).textTheme.bodyText1
            ),
          Text(
            "Calendar",
            style:  Theme.of(context).textTheme.headline1
          )
        ],),
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
