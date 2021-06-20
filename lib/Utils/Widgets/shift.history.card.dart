import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../Routes.dart';

class ShiftHistoryCard extends StatelessWidget {

  final String shiftName;
  final String shiftStartTime;
  final String shiftEndTime;
  final String activityId;
  final int totalHours;

  const ShiftHistoryCard(
      {Key key,
      this.shiftName,
      this.activityId,
      this.shiftStartTime,
      this.shiftEndTime,
      this.totalHours})
      : super(key: key);

  DateTime formatDate(String date) {
    return DateTime.parse(date);
  }

  @override
  Widget build(BuildContext context) {
    String formatTotalHours(int milliseconds) {
      var secs = milliseconds ~/ 1000;
      var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
      var hours = (secs ~/ 3600).toString().padLeft(2, '0');
      return '$hours.$minutes';
    }

    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamed(Routes.map, arguments: activityId);
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffeaeaea)),
            borderRadius: BorderRadius.circular(20),
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
                        '${(DateFormat('E').format(formatDate(shiftStartTime)))}'[
                            0],
                        style: GoogleFonts.nunito(
                          color: Theme.of(context).primaryColor,
                          fontSize: ScreenUtil().setSp(40),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "${formatDate(shiftStartTime).day} th",
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
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: DateFormat('h:mm a')
                                .format(formatDate(shiftStartTime)),
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Book",
                                letterSpacing: 1,
                                color: Colors.black.withOpacity(.8),
                                fontSize: 12),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: 5,
                            ),
                          ),
                          TextSpan(
                            text: "-",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Book",
                                letterSpacing: 1,
                                color: Colors.black.withOpacity(.8),
                                fontSize: 15),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: 5,
                            ),
                          ),
                          TextSpan(
                            text: DateFormat('h:mm a')
                                .format(formatDate(shiftEndTime)),
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Book",
                                letterSpacing: 1,
                                color: Colors.black.withOpacity(.8),
                                fontSize: 12),
                          )
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(shiftName,
                          style: Theme.of(context).textTheme.headline5),
                      Text(
                        '${(DateFormat(' MMMM . yyyy').format(formatDate(shiftStartTime)))}',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: 1,
                            color: Colors.black.withOpacity(.5),
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "${formatTotalHours(totalHours)} Hrs",
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Color(0xff344644),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
