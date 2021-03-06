import 'package:Quete/Utils/Widgets/schedule.card.dart';
import 'package:Quete/graphql/schema.graphql.dart';
import 'package:intl/intl.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule>with TickerProviderStateMixin {
  CalendarController _calendarController;

  Map<DateTime,List<GetAllActivities$QueryRoot$Activities>> _groupedEvents;
  DateTime _selectedDate;
  var _selectedEvents=[];


  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }



 DateTime dateNorm(DateTime date){
    String normDate= DateFormat.yMd().format(date);
    return DateFormat.yMd().parse(normDate);
 }


  // grouping events for the each date
 void  _groupEvents(List<GetAllActivities$QueryRoot$Activities> events){
    _groupedEvents={};
    events.forEach((element) {
      _groupedEvents.putIfAbsent(dateNorm(element.shift.shiftDate), () => _eventsToList(events, element.shift.shiftDate));
    });

  }

  // To sort out all the events on a particular date
  List<GetAllActivities$QueryRoot$Activities> _eventsToList(List<GetAllActivities$QueryRoot$Activities> events,DateTime dateTime){
    List<GetAllActivities$QueryRoot$Activities> groupedList=[];
    events.forEach((element) {
      if(element.shift.shiftDate==dateTime){
      groupedList.add(element);
    }});
    return groupedList;
  }


  // for setting the event marker on the date
  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date) ? Colors.white: _calendarController.isToday(date) ? Color(0xFFffffff).withOpacity(.8) : Color(0xFF0000000).withOpacity(.8),
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
    final _availableShifts = Provider.of<ActivityService>(context);

    _groupEvents(_availableShifts.getInCompletedActivities());

    _selectedDate=(_calendarController.selectedDay!=null)?dateNorm(_calendarController.selectedDay):dateNorm(DateTime.now());



    void _onDaySelected(DateTime selectedDay) {
      setState(() {
        _selectedDate = (_selectedDate!=null)?dateNorm(selectedDay) :dateNorm(DateTime.now());
      });

       _selectedEvents= _groupedEvents[_selectedDate]??[];
    }

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
                    onDaySelected:(date, event, _)=>_onDaySelected(date),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    formatAnimation: FormatAnimation.slide,
                    builders: CalendarBuilders(
                     selectedDayBuilder:(context, date, _){
                       return Container(
                         
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Theme.of(context).primaryColor,
                         ),

                         width: 50,
                         height: 50,
                         child: Center(
                           child: Text(
                             '${date.day}',
                             style: TextStyle().copyWith(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w900),

                           ),
                         ),
                       );
                     },
                      outsideHolidayDayBuilder: (context, date, _){
                        return Container(
                          margin: const EdgeInsets.all(4.0),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.black,width: 2)
                          ),

                          width: 50,
                          height: 50,
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle().copyWith(fontSize: 14.0,color:
                              Colors.black,fontWeight: FontWeight.w900),

                            ),
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
                        todayColor: Theme.of(context).primaryColor,
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
                      ScheduleCard(
                        activityId:  _selectedEvents[index].activityId,
                        shiftTime:_selectedEvents[index].shift.shiftTime ,
                        shiftDate: _selectedEvents[index].shift.shiftDate,
                        shiftName: _selectedEvents[index].shift.shiftName,
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
      toolbarHeight: 100,
      title: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Monthly",
                style:    TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: "Futura Book",
                    letterSpacing: 1,
                    color: Colors.black.withOpacity(.8),
                    fontSize: 14),

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
