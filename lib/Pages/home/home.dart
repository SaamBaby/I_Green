import 'package:Quete/Pages/application/application.dart';
import 'package:Quete/Pages/auth/Login.dart';
import 'package:Quete/Pages/notifications/NotificationsPage.dart';
import 'package:Quete/Pages/profile/Profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'JobDetails.dart';






class JobFeeds extends StatefulWidget {
  @override
  _JobFeedsState createState() => _JobFeedsState();
}

class _JobFeedsState extends State<JobFeeds> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Welcome to your Dashboard",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "SamBaby!\n",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                    },
                    icon: FaIcon(FontAwesomeIcons.bell,color: Colors.black,size:18),
                  ),
                  GestureDetector(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                    },
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                  )
                ],
              ),
              // Search bar

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Color(0xfff2f2f2),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          icon: Icon(
                            Icons.search,
                            size: 22,
                            color: Colors.black54,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontFamily: 'Futura Book',
                              color: Colors.black.withOpacity(.7),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFa6e76c)),
                    child: Icon(
                      Icons.filter_list,
                      size: 22,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFa6e76c).withOpacity(.3)),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Complete your profile ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Futura Bold',
                          color: Color(0xFFa6e76c),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Urgently needed Replacements",
                    style: TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withOpacity(.9)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                  Text(
                                    "\$100K - \$150K",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Senior Mobile Developer",
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Twitter . California . CA",
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFFa6e76c)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                  Text(
                                    "\$100K - \$150K",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Senior Mobile Developer",
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Twitter . California . CA",
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withOpacity(.9)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                  Text(
                                    "\$100K - \$150K",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Senior Mobile Developer",
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Twitter . California . CA",
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.white.withOpacity(.8),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                                ],
                              )
                            ],
                          )),
                    ]),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Available Jobs for You",
                    style:TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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

                                  Text(
                                    "Senior Mobile Developer",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Twitter . California . CA",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),

                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> JobDetails()));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
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
                                    Text(
                                      "Fulltime  contract".toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: 'Futura Heavy',
                                          color: Color(0xFFa6e76c),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      "Senior Mobile Developer",
                                      style: TextStyle(
                                          fontFamily: 'Futura Book',
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Twitter . California . CA",
                                      style: TextStyle(
                                          fontFamily: 'Futura Book',
                                          color: Colors.black.withOpacity(.6),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),

                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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

                                  Text(
                                    "Senior Mobile Developer",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Twitter . California . CA",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),

                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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

                                  Text(
                                    "Senior Mobile Developer",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Twitter . California . CA",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),

                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

