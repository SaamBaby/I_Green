
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Routes.dart';

class ScheduleCard extends StatelessWidget {
  final String shiftName;
  final String shiftTime;
  final DateTime shiftDate;
  final String activityId;

  const ScheduleCard({Key key, this.shiftName, this.shiftTime, this.shiftDate, this.activityId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.addHours, arguments: activityId);
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: double.infinity,

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
                        '${(DateFormat('E').format(shiftDate))}'[
                            0],
                        style: GoogleFonts.nunito(
                          color: Colors.blueAccent,
                          fontSize: ScreenUtil().setSp(40),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "${shiftDate.day} th",
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
                        // '${(DateFormat('h:mm a').format(shiftData.shiftDateTime))}',
                        shiftTime,
                        style: Theme.of(context).textTheme.bodyText2
                      ),
                      SizedBox(
                       height: 10,
                      ),
                      Text(
                       shiftName,
                        style: Theme.of(context).textTheme.headline5
                      ),

                      Text(
                        '${(DateFormat(' MMMM . yyyy').format(shiftDate))}',
                        style: Theme.of(context).textTheme.bodyText2
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
