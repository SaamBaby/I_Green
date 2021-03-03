import 'package:Quete/models/Job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'JobDetails.dart';

class UrgentJobCard extends StatelessWidget {
  final String jobLogo;
  final double Salary;
  final String jobId;
  final String jobName;
  final String jobLocation;
  final bool isPartTime;
  final bool isFullTime;
  final bool isContract;

  const UrgentJobCard(
      {Key key,
      this.jobLogo,
      this.Salary,
      this.jobName,
      this.jobLocation,
      this.isPartTime,
      this.isFullTime,
      this.isContract,  this.jobId});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(JobDetails.routName,arguments: jobId);
      },
      child: Container(

          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          margin: EdgeInsets.only(right: 10),
          width: 300,
          height: 200,
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
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Icon(
                      FontAwesomeIcons.twitter,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: Salary.toString(),
                              style:
                              TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)
                          ),
                          TextSpan(
                              text: ' CAD/ hr',
                              style:
                              TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)
                          )
                        ]),
                  ),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                jobName,
                style: TextStyle(
                    fontFamily: 'Futura Heavy',
                    color: Color(0xffffffff).withOpacity(.8),
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    text: jobLocation.replaceAll(',', ' .').split(".").first,
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.white.withOpacity(.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' . ',
                          style:
                          TextStyle(
                              fontFamily: 'Futura Book',
                              color: Colors.white.withOpacity(.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                         ),
                      TextSpan(
                        text: jobLocation.replaceAll(',', ' .').split(".").last,
                        style: TextStyle(

                            fontFamily: 'Futura Book',
                            color: Colors.white.withOpacity(.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),

                      )

                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible:isFullTime ,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      margin: EdgeInsets.only(right: 5),
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(.6)),
                      child: Text(
                        "Full-Time",
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.white.withOpacity(.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isPartTime,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      margin: EdgeInsets.only(right: 5),
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(.6)),
                      child: Text(
                        "Part-Time",
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.white.withOpacity(.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isContract,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(.6)),
                      child: Text(
                        "Contract",
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.white.withOpacity(.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}


class JobCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobData = Provider.of<JobModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(JobDetails.routName,arguments: jobData.jobId);
      },
      child: Container(
        margin:EdgeInsets.only(top: 20),
          padding:
          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                offset:
                Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                            visible: jobData.isContract,
                            child: Text(
                              " contract .".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Futura Heavy',
                                  color: Color(0xFF54E597),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Visibility(
                            visible: jobData.isFullTime,
                            child: Text(
                              " Full-time .".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Futura Heavy',
                                  color: Color(0xFF54E597),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Visibility(
                            visible: jobData.isPartTime,
                            child: Text(
                              " Part-time .".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Futura Heavy',
                                  color: Color(0xFF54E597),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        jobData.jobName,
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Color(0xff000000).withOpacity(.8),
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      RichText(
                        text: TextSpan(
                            text: jobData.jobLocation.replaceAll(',', ' .').split(".").first,
                            style: TextStyle(
                                fontFamily: 'Futura Book',
                                color: Colors.black.withOpacity(.5),
                                fontSize: 12,
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
                                text: jobData.jobLocation.replaceAll(',', ' .').split(".").last,
                                style: TextStyle(

                                    fontFamily: 'Futura Book',
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),

                              )

                            ]),
                      ),
                    ],
                  ),
                    Spacer(),
                  Consumer<JobModel>(
                    builder: (context, jobData, _) => GestureDetector(
                      onTap: () {
                        print(jobData.isFavourite);
                        jobData.toggleFavoriteStatus(jobData.jobId);
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        child: Icon(
                            jobData.isFavourite
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: jobData.isFavourite
                                ? Colors.lightGreenAccent
                                : Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}