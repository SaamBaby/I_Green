import 'package:Quete/Pages/notification/notifications.screen.dart';
import 'package:Quete/Pages/profile/profile.screen.dart';
import 'package:Quete/Views/home/closed_shifts.feed.view.dart';
import 'package:Quete/Views/home/open_shift.feed.view.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Quete/services/cache/user.cache.service.dart';


class ShiftFeeds extends StatefulWidget {
  @override
  _ShiftFeedsState createState() => _ShiftFeedsState();
}

class _ShiftFeedsState extends State<ShiftFeeds> {
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final _discoveryService = DiscoveryService()..getShifts();
    return  ChangeNotifierProvider.value(
        value: _discoveryService,
         child:Scaffold(

           backgroundColor: Colors.white,
           appBar: AppBar(toolbarHeight: 0,),
           body: Padding(
             padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
               (5),horizontal: ScreenUtil().setWidth(30)),
             child: ListView(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                             "Welcome to your Dashboard",
                             textAlign: TextAlign.start,
                             style: Theme.of(context).textTheme.bodyText1),
                         SizedBox(
                           height: 5,
                         ),
                         Text(
                             "${UserCacheService.user.displayName?? "user"}Baby"
                                 "\n",
                             textAlign: TextAlign.start,
                             style: Theme.of(context).textTheme.headline1),

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
                     IconButton(
                       onPressed: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => Profile()));
                       },
                       icon: FaIcon(FontAwesomeIcons.user,
                           color: Colors.black, size: 18),
                     ),

                   ],
                 ),
                 Row(
                   children: [
                     Expanded(
                       child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 15),
                         height: 50,
                         decoration: BoxDecoration(
                             color: Color(0xfff2f2f2),
                             borderRadius: BorderRadius.circular(10)),
                         child: TextField(
                             cursorColor: Colors.blue,
                             decoration: InputDecoration(
                                 contentPadding:
                                 EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                 icon: Icon(
                                   Icons.search,
                                   size: 22,
                                   color: Colors.black,
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(color: Colors.transparent),
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(color: Colors.transparent),
                                 ),
                                 hintText: "Search",
                                 border: InputBorder.none,
                                 hintStyle: Theme.of(context).textTheme.subtitle2
                             ),
                             style: Theme.of(context).textTheme.bodyText1
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
                           // boxShadow: [
                           //   BoxShadow(
                           //     color: Colors.black.withOpacity(.1),
                           //     blurRadius: 1.0, // soften the shadow
                           //     spreadRadius: 1.0, //extend the shadow
                           //     offset: Offset(
                           //       .01, // Move to right 10  horizontally
                           //       1.0, // Move to bottom 5 Vertically
                           //     ),
                           //   )
                           // ],
                           border: Border.all(color: Color(0xffeaeaea)),
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.white),
                       child: Icon(
                         Icons.filter_list,
                         size: 22,
                         color: Colors.black,
                       ),
                     )
                   ],
                 ),
                 SizedBox(
                   height: 25,
                 ),
                 Text(
                     "Urgent replacements",
                     style:  Theme.of(context).textTheme.headline5),
                 SizedBox(
                   height: 15,
                 ),
                 // SizedBox(
                 //   height: 200.0,
                 //   child: Consumer<Jobs>(
                 //
                 //     builder:(context,job,_)=> ListView.builder(
                 //       shrinkWrap: true,
                 //       scrollDirection: Axis.horizontal,
                 //       itemCount: job.urgentJobs.length,
                 //       itemBuilder: (BuildContext context, int index) =>
                 //           OpenShiftCard(
                 //             jobId: job.urgentJobs[index].jobId,
                 //             jobName: job.urgentJobs[index].jobName,
                 //             jobLocation: job.urgentJobs[index].jobLocation,
                 //             salary: job.urgentJobs[index].jobSalary,
                 //             jobLogo: job.urgentJobs[index].jobLogo,
                 //             isContract: job.urgentJobs[index].isContract,
                 //             isFullTime: job.urgentJobs[index].isFullTime,
                 //             isPartTime: job.urgentJobs[index].isPartTime,
                 //           ),
                 //     ),
                 //   ),
                 // ),
                 OpenShiftFeedView(),
                 SizedBox(
                   height: 30,
                 ),

                 Text(
                   "Available Jobs for You",
                     style:  Theme.of(context).textTheme.headline5
                 ),
                ShiftFeedView()
               ],
             ),
           ),
         ),
    );
  }
}

