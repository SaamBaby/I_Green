import 'package:Quete/Pages/schedule/Schedule.dart';
import 'package:Quete/providers/appliedJobs_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'AppliedJobCard.dart';


class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) => Provider.of<AppliedJobs>(context,listen: false).fetchAppliedJobs());
  }




  @override
  Widget build(BuildContext context) {
    final loadedAppliedJobs= Provider.of<AppliedJobs>(context).items;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  color: Colors.white,
                  child: Column(
                    children: [

                      Container(
                        child:  ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:loadedAppliedJobs.length ,
                          itemBuilder: (BuildContext context, int index) =>
                              Visibility(
                                  visible: (!loadedAppliedJobs.values.toList()[index].isApproved),
                                  child: AppliedJobsCard(
                                    date: loadedAppliedJobs.values.toList()[index].appliedDate, jobId:loadedAppliedJobs.values.toList()[index].jobId ,)
                              ),


                        ),
                      ),

                    ],
                  )
                ),
            Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Column(

                    children: [
                      Container(
                        child:  ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: loadedAppliedJobs.length ,
                          itemBuilder: (BuildContext context, int index) =>
                              Visibility(
                                  visible:loadedAppliedJobs.values.toList()[index].isApproved,
                                  child: AppliedJobsCard(date: loadedAppliedJobs.values.toList()[index].appliedDate,jobId:loadedAppliedJobs.values.toList()[index].jobId,)
                              ),


                        ),
                      ),

                    ],
                  )
                ))
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,

      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      brightness: Brightness.light,
      title: Text("Applications",
          style: TextStyle(
              fontFamily: 'Futura Heavy',
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold),),
      actions: <Widget>[

        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Schedule()));
              },
              child: FaIcon(FontAwesomeIcons.calendarCheck,
                size: 25,
                color: Colors.black,
              ),
            )
        ),
      ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  color: Color(0xfff1f1f1)),
              width: MediaQuery.of(context).size.width / 1.05,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.5,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Applied (35)",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Approved (15)",
                              style:TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}


