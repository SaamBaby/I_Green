import 'package:Quete/Utils/Widgets/shift.cards.screen.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OpenShiftFeedView extends StatefulWidget {
  @override
  _OpenShiftFeedViewState createState() => _OpenShiftFeedViewState();
}

class _OpenShiftFeedViewState extends State<OpenShiftFeedView> {


  @override
  Widget build(BuildContext context) {
    final _discoveryService = DiscoveryService()..getOpenShifts();
    return ChangeNotifierProvider.value(
      value: _discoveryService,
      child: SizedBox(
          height: 210.0,
          child:  Consumer<DiscoveryService>(
            builder: (context,openShift,_)=>
            (openShift.openShiftFeed.length==0)?
            Center(
              child: Container(
                  padding:EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Schedule/noData.png',
                        height: 180.0,
                        width: 240.0,

                      ),
                      Text("No open shifts available")
                    ],
                  )),
            ):ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: openShift.openShiftFeed.length,
              itemBuilder: (BuildContext context, int index) => OpenShiftCard(
                    jobId: openShift.openShiftFeed[index].shift.jobId,
                    openShiftId:openShift.openShiftFeed[index].openShiftsId,
                    shiftName:openShift.openShiftFeed[index].shift.job.jobName,
                    shiftTime:openShift.openShiftFeed[index].shift.shiftTime,
                    shiftLocation:openShift.openShiftFeed[index].shift.job.jobLocation,
                    shiftDate:openShift.openShiftFeed[index].shift.shiftDate,
                    salary:openShift.openShiftFeed[index].shift.job.jobSalary
                  ),
            ),
          ),
        ),
    );
  }
}
