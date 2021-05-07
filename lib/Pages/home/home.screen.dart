import 'package:Quete/Pages/notification/notifications.screen.dart';
import 'package:Quete/Pages/profile/profile.screen.dart';
import 'package:Quete/Utils/Widgets/shift.cards.screen.dart';
import 'package:Quete/Views/home/closed_shifts.feed.view.dart';
import 'package:Quete/Views/home/open_shift.feed.view.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';
import 'package:Quete/providers/jobs_provider.dart';
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
         builder: (context,_) =>Padding(
           padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth
             (5),horizontal: ScreenUtil().setWidth(30)),
           child: ListView(
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
                           style: Theme.of(context).textTheme.bodyText1),
                       SizedBox(
                         height: 5,
                       ),
                       Text(
                           "${UserCacheService.user.displayName?? "user"}...\n",
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
                         borderRadius: BorderRadius.circular(15),
                         color: Color(0xFF54E597)),
                     child: Icon(
                       Icons.filter_list,
                       size: 22,
                       color: Colors.white,
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
               Expanded(
                   child: ShiftFeedView()
               ),

             ],
           ),
         ),
    );
  }
}

