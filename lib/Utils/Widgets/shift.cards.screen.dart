import 'package:Quete/Pages/home/home.open.shift.job.details.dart';
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
  final String shiftName;
  final String shiftLocation;
  final DateTime shiftDate;
  final String salary;
  final bool isFullTime;
  final bool isPartTime;
  final String jobDescription;

  const OpenShiftCard({Key key,
    this.openShiftId,
    this.shiftName,
    this.shiftLocation,
    this.shiftDate,
    this.salary,
    this.isFullTime,
    this.isPartTime,
    this.jobDescription}) : super(key: key);





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
            (20),horizontal: ScreenUtil().setWidth(20)),
          margin: EdgeInsets.only(right: 10),
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(.8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Visibility(
                          visible: isFullTime,
                          child: Text(
                            "FULL TIME",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Heavy",
                                letterSpacing: .8,
                                color: Colors.white,
                                fontSize: 10),
                          ),
                        ),
                        Visibility(
                          visible: isPartTime,
                          child: Text(
                            ", PART TIME",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Heavy",
                                letterSpacing: .8,
                                color:  Theme.of(context).primaryColor,
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: (){},
                      color: Colors.white,
                      icon: Icon(FontAwesomeIcons.bookmark),
                    )

                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        shiftName,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Colors.white,
                            fontSize: 18,
                            height: 1.5,
                            letterSpacing: .8,
                            fontWeight: FontWeight.bold),
                       ),
                    SizedBox(height: 10,),
                    Text(
                        jobDescription,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 1.5,
                            color: Colors.white.withOpacity(.8),
                            fontSize: 12)  ),
                  ],
                ),

              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: shiftLocation.replaceAll(',', ' .').split(""
                              ".").first,
                          style:TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Book",
                              letterSpacing: .8,
                              height: 1,
                              color: Colors.white.withOpacity(.8),
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' . ',
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Futura Book",
                                  letterSpacing: .8,
                                  height: .8,
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 12),
                            ),
                            TextSpan(
                              text: (shiftLocation.replaceAll(', ', ''
                                  '.').split('.').last).toString().split
                                (' ').first,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Futura Book",
                                  letterSpacing: .8,
                                  height: 1,
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 12),

                            ),



                          ]),
                    ),
                    Spacer(),
                    Text(
                     salary.toString(),
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: 1,
                          color: Colors.white.withOpacity(.8),
                          fontSize: 12),
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
  final bool isFullTime;
  final bool isPartTime;
  final String description;



  const ClosedShiftCard({Key key, this.shiftName, this.shiftLocation, this.shiftDate, this.jobId, this.shiftTime, this.closedShiftId, this.isFullTime, this.isPartTime, this.description}) : super(key: key);

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
                  Container(
                    width: 60,
                    height: 60,
                   margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        '${(DateFormat('EEE').format(shiftDate))}'[
                        0],
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Visibility(
                            visible: isFullTime,
                            child: Text(
                              "FULL TIME",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Futura Heavy",
                                  letterSpacing: .8,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 10),
                            ),
                          ),
                          Visibility(
                            visible: isPartTime,
                            child: Text(
                              ", PART TIME",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Futura Heavy",
                                  letterSpacing: .8,
                                  color:  Theme.of(context).primaryColor,
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(
                        shiftName,
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Colors.black.withOpacity(.8),
                            fontSize: 16,
                            height: 1.5,
                            letterSpacing: .8,
                            fontWeight: FontWeight.bold),
                      ),

                      RichText(
                        text: TextSpan(
                            text: shiftLocation.replaceAll(',', ' .').split(""
                                ".").first,
                            style:TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Book",
                                letterSpacing: .8,
                                height: 1,
                                color: Colors.black.withOpacity(.5),
                                fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' . ',
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Futura Book",
                                    letterSpacing: .8,
                                    height: .8,
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 12),
                              ),
                              TextSpan(
                                text: (shiftLocation.replaceAll(', ', ''
                                    '.').split('.').last).toString().split
                                  (' ').first,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Futura Book",
                                    letterSpacing: .8,
                                    height: 1,
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 12),

                              ),



                            ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}