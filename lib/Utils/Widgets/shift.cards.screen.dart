import 'package:Quete/Pages/home/home.open.shift.job.details.dart';
import 'package:Quete/models/Job.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../Pages/home/home.cloesed.job.details.dart';
import '../../Routes.dart';

class OpenShiftCard extends StatelessWidget {
  final String openShiftId;
  final int jobId;
  final String shiftName;
  final String shiftTime;
  final String shiftLocation;
  final DateTime shiftDate;
  final String salary;

  const OpenShiftCard({Key key,
    this.openShiftId,
    this.jobId,
    this.shiftName,
    this.shiftTime,
    this.shiftLocation,
    this.shiftDate,
    this.salary}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    final _feed = Provider.of<DiscoveryService>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(
            value: _feed,
            child:  OpenJobDetails(openShiftId: openShiftId,),
          ),)
        );
      },
      child: Container(

          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
            (25),horizontal: ScreenUtil().setWidth(20)),
          margin: EdgeInsets.only(right: 10),
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(.8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text(
                              '${(DateFormat('E').format(shiftDate))}'[
                              0],
                              style:  TextStyle(
                                  fontFamily: 'Futura Heavy',
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold)
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "${shiftDate.day} th",
                          style: Theme.of(context).textTheme.subtitle1
                        ),

                      ],
                    ),
                    // RichText(
                    //   text: TextSpan(
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //             text: "\$CA ",
                    //             style:
                    //             Theme.of(context).textTheme.subtitle1
                    //         ),
                    //         TextSpan(
                    //             text:salary,
                    //             style:
                    //             Theme.of(context).textTheme.subtitle1
                    //         ),
                    //
                    //       ]),
                    // ),
                    IconButton(
                      onPressed: (){},
                      color: Colors.white,
                      icon: Icon(FontAwesomeIcons.bookmark),
                    )

                  ],
                ),
              ),
           SizedBox(height: 10,),
              Expanded(
                flex: 1,
                child: Text(

                  shiftName,
                  overflow: TextOverflow.visible,
                  style:  GoogleFonts.nunito(
                    height: 1.2,
                    fontSize: ScreenUtil().setSp(18),
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  )),
              ),
              SizedBox(height: 20,),
             Expanded(
               flex: 1,
                child: RichText(
                  text: TextSpan(
                      text: shiftLocation.replaceAll(',', ' .').split(".").first,
                      style: Theme.of(context).textTheme.caption,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' . ',
                            style:
                            Theme.of(context).textTheme.subtitle1,
                           ),
                        TextSpan(
                          text:  shiftLocation.replaceAll(',', ' .').split(".").last,
                          style: Theme.of(context).textTheme.caption

                        )

                      ]),
                ),
              ),

              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5,
                          horizontal: 10),
                      margin: EdgeInsets.only(right: 10),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black),
                      child: Text(
                        "Full-Time",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5,
                          horizontal: 10),
                      margin: EdgeInsets.only(right: 10),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black),
                      child: Text(
                        "Part-Time",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}


class ClosedShiftCard extends StatelessWidget {
  final int closedShiftId;
  final int jobId;
  final String shiftName;
  final String shiftTime;
  final String shiftLocation;
 final DateTime shiftDate;



  const ClosedShiftCard({Key key, this.shiftName, this.shiftLocation, this.shiftDate, this.jobId, this.shiftTime, this.closedShiftId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _feed = Provider.of<DiscoveryService>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(
            value: _feed,
            child: JobDetails(closedShiftId: closedShiftId,),
          ),)
        );
        // Navigator.of(context).pushNamed(Routes.jobDetails,arguments: closedShiftId);
      },
      child: Container(
        margin:EdgeInsets.only(top: 20),
          padding:
          EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
            (20),horizontal: ScreenUtil().setWidth(20)),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffeaeaea)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded (
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          '${(DateFormat('EEE').format(shiftDate))}'[
                          0],
                          style: TextStyle(
                              fontFamily: 'Futura Heavy',
                              color: Theme.of(context).primaryColor,
                              fontSize: 51,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${shiftDate.day} th",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),

                  Expanded (
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shiftName,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        RichText(
                          text: TextSpan(
                              text: shiftLocation.replaceAll(',', ' .').split(""
                                  ".").first,
                              style: Theme.of(context).textTheme.bodyText2,
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' . ',
                                  style:
                                  TextStyle(

                                      fontFamily: 'Futura Book',
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                    text: shiftLocation.replaceAll(',', ' .').split(".").last,
                                    style: Theme.of(context).textTheme.bodyText2

                                )

                              ]),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
    );
  }
}