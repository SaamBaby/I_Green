import 'package:Quete/Utils/Widgets/shift.cards.screen.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShiftFeedView extends StatefulWidget {
  @override
  _ShiftFeedViewState createState() => _ShiftFeedViewState();
}

class _ShiftFeedViewState extends State<ShiftFeedView> {


  @override
  Widget build(BuildContext context) {

    final _feed = Provider.of<DiscoveryService>(context,listen: true).feed;
    return
    Container(child:
    (_feed.length==0)?
    Center(
      child: Container(
          padding:EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Schedule/noData.png',
                height: 240.0,
                width: 240.0,

              ),
              Text("No Shifts allotted for you")
            ],
          )),
    ):
    ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: _feed.length,
      itemBuilder: (BuildContext context, int index) =>
      ClosedShiftCard(
        jobId: _feed[index].shift.job.jobId,
        closedShiftId:_feed[index].closedShiftsId,
        shiftName:_feed[index].shift.job.jobName,
        shiftDate: _feed[index].shift.shiftDate,
        shiftLocation:_feed[index].shift.job.jobLocation,
        shiftTime:_feed[index].shift.shiftTime,

      ),
    ),
    );
  }
}
