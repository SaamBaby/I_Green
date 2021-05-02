import 'package:Quete/models/Job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../Pages/home/home.job.details.dart';
import '../../Routes.dart';

class OpenShiftCard extends StatelessWidget {
  final String jobLogo;
  final double salary;
  final String jobId;
  final String jobName;
  final String jobLocation;
  final bool isPartTime;
  final bool isFullTime;
  final bool isContract;

  const OpenShiftCard(
      {Key key,
      this.jobLogo,
      this.salary,
      this.jobName,
      this.jobLocation,
      this.isPartTime,
      this.isFullTime,
      this.isContract,  this.jobId});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.jobDetails,arguments: jobId);
      },
      child: Container(

          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
            (20),horizontal: ScreenUtil().setWidth(20)),
          margin: EdgeInsets.only(right: 10),
          width: 300,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff000000).withOpacity(.8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${(DateFormat('E').format(DateTime.now()))}'[
                        0],
                        style:  Theme.of(context).textTheme.headline2
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "${DateTime.now().day} th",
                        style: Theme.of(context).textTheme.subtitle1
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: salary.toString(),
                              style:
                              Theme.of(context).textTheme.subtitle1
                          ),
                          TextSpan(
                              text: ' CAD/ hr',
                              style:
                              Theme.of(context).textTheme.subtitle1
                          )
                        ]),
                  ),

                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                jobName,
                style: Theme.of(context).textTheme.headline3),
              SizedBox(
                height: 3,
              ),
              RichText(
                text: TextSpan(
                    text: jobLocation.replaceAll(',', ' .').split(".").first,
                    style: Theme.of(context).textTheme.subtitle1,
                    children: <TextSpan>[
                      TextSpan(
                          text: ' . ',
                          style:
                          Theme.of(context).textTheme.subtitle1,
                         ),
                      TextSpan(
                        text: jobLocation.replaceAll(',', ' .').split(".").last,
                        style: Theme.of(context).textTheme.subtitle1

                      )

                    ]),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [

                  Text(
                    '${(DateFormat(' MMMM . yyyy').format(DateTime.now()))}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${(DateFormat('h:mm a').format(DateTime.now()))}',
                    style:Theme.of(context).textTheme.subtitle1,
                  ),

                ],
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
    // final jobData = Provider.of<JobModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.jobDetails,arguments: jobId);
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
            boxShadow: [
              BoxShadow(
                color: Color(0xffeaeaea),
                spreadRadius: 0,
                blurRadius: 3,
                offset:
                Offset(1, 1), // changes position of shadow
              ),
            ],
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
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${(DateFormat(' MMMM . yyyy').format(shiftDate))}',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '. $shiftTime',

                              style: Theme.of(context).textTheme.subtitle2,
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          shiftName,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: shiftLocation.replaceAll(',', ' .').split(""
                                  ".").first,
                              style: Theme.of(context).textTheme.subtitle2,
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
                                    style: Theme.of(context).textTheme.subtitle2

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