import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:Quete/providers/jobs_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppliedJobsCard extends StatelessWidget {
  final DateTime  date;
  final String jobId;

  const AppliedJobsCard({this.date,this.jobId});

  @override
  Widget build(BuildContext context) {
    final jobsData = Provider.of<Jobs>(context);
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: 20),
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: 120,
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
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: Icon(
                    FontAwesomeIcons.twitter,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: jobsData.getJobById(jobId).isContract,
                          child: Text(
                            " contract,".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Futura Heavy',
                                color: Color(0xFFa6e76c),
                                fontSize: 12,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Visibility(
                          visible: jobsData.getJobById(jobId).isFullTime,
                          child: Text(
                            " Full-time,".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Futura Heavy',
                                color: Color(0xFFa6e76c),
                                fontSize: 12,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Visibility(
                          visible: jobsData.getJobById(jobId).isPartTime,
                          child: Text(
                            " Part-time".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Futura Heavy',
                                color: Color(0xFFa6e76c),
                                fontSize: 12,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5,),
                    Text(
                      jobsData.getJobById(jobId).jobName,
                      style: TextStyle(
                          fontFamily: 'Futura Book',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    RichText(
                      text: TextSpan(
                          text: jobsData.getJobById(jobId).jobLocation.replaceAll(',', ' .').split(".").first,
                          style: TextStyle(
                              fontFamily: 'Futura Book',
                              color: Colors.black.withOpacity(.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
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
                              text: jobsData.getJobById(jobId).jobLocation.replaceAll(',', ' .').split(".").last,
                              style: TextStyle(

                                  fontFamily: 'Futura Book',
                                  color: Colors.black.withOpacity(.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),

                            )

                          ]),
                    ),

                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                  text: 'Applied on  ',
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black.withOpacity(.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                        text:  '${(DateFormat('d. MMM. yyyy').format(date))}',
                        style:
                        TextStyle(color: Colors.blueAccent, fontSize: 13),)
                  ]),
            ),
          ],
        ));
  }
}