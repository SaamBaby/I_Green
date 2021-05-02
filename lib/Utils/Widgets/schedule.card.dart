import 'package:Quete/Pages/schedule/schedule.addHours.screen.dart';
import 'package:Quete/models/job_shifts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Routes.dart';

class ScheduleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shiftData = Provider.of<ShiftModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.addHours, arguments: shiftData.shiftId);
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffeaeaea)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        '${(DateFormat('E').format(shiftData.shiftDateTime))}'[
                            0],
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Colors.blueAccent,
                            fontSize: 51,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${shiftData.shiftDateTime.day} th",
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Color(0xff344644),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${(DateFormat('h:mm a').format(shiftData.shiftDateTime))}',
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Color(0xff344644),
                            fontSize: 14,
                            height: 2,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        shiftData.shiftName,
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Color(0xff000000).withOpacity(.8),
                            fontSize: 20,
                            letterSpacing: 1,
                            height: 1.5,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '${(DateFormat(' MMMM . yyyy').format(shiftData.shiftDateTime))}',
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.grey.withOpacity(.7),
                            fontSize: 13,
                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
