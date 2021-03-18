import 'package:flutter/cupertino.dart';

class ShiftModel with ChangeNotifier {
  final String shiftId;
  final String jobId;
  final String shiftName;
  final DateTime shiftDateTime;
  final bool isComplete;
  final DateTime shiftStartTime;
  final DateTime shiftEndTime;


  ShiftModel(
      {
        this.shiftId,
        this.jobId,
        this.shiftStartTime,
        this.shiftEndTime,
        this.shiftName,
        this.shiftDateTime,
        this.isComplete});
}
