import 'package:Quete/Pages/notifications/NotificationsPage.dart';
import 'package:Quete/Pages/profile/Profile.dart';
import 'package:provider/provider.dart';
import 'package:Quete/providers/jobs_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'JobCards.dart';

class JobFeeds extends StatefulWidget {
  @override
  _JobFeedsState createState() => _JobFeedsState();
}

class _JobFeedsState extends State<JobFeeds> {
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => Provider.of<Jobs>(context,listen: false).fetchAppliedJobs());
  }
  Future<void> _refreshJobs(BuildContext context) async{
    await Provider.of<Jobs>(context,listen: false).fetchAppliedJobs();

  }
  @override
  Widget build(BuildContext context) {
    final jobsData = Provider.of<Jobs>(context).items;
    return RefreshIndicator(
      onRefresh:()=> _refreshJobs(context),
      child: Padding(
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications()));
                      },
                      icon: FaIcon(FontAwesomeIcons.bell,
                          color: Colors.black, size: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
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
                  mainAxisSize: MainAxisSize.min,
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
                      height: 15,
                    ),
                    SizedBox(
                      height: 200.0,
                      child: Consumer<Jobs>(

                        builder:(context,job,_)=> ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: job.urgentJobs.length,
                          itemBuilder: (BuildContext context, int index) =>
                              UrgentJobCard(
                                jobId: job.urgentJobs[index].jobId,
                                jobName: job.urgentJobs[index].jobName,
                                jobLocation: job.urgentJobs[index].jobLocation,
                                Salary: job.urgentJobs[index].jobSalary,
                                jobLogo: job.urgentJobs[index].jobLogo,
                                isContract: job.urgentJobs[index].isContract,
                                isFullTime: job.urgentJobs[index].isFullTime,
                                isPartTime: job.urgentJobs[index].isPartTime,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Available Jobs for You",
                      style: TextStyle(
                          fontFamily: 'Futura Book',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child:  ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: jobsData.length,
                          itemBuilder: (BuildContext context, int index) => ChangeNotifierProvider.value(
                            value: jobsData[index],
                            child: Visibility(
                              visible:(!jobsData[index].isUrgent) ,
                              child: JobCard(
//                              jobColor: JobData[index].jobColor,
//                              jobName: JobData[index].jobName,
//                              jobLocation: JobData[index].jobLocation,
//                              Salary: JobData[index].jobSalary,
//                              jobLogo: JobData[index].jobLogo,
//                              jobId:JobData[index].jobId,
//                              isContract: JobData[index].isContract,
//                              isFullTime: JobData[index].isFullTime,
//                              isPartTime: JobData[index].isPartTime,
                                  ),
                            ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
