import 'package:flutter/cupertino.dart';

class ShiftModel with ChangeNotifier {
  final String shiftId;
  final String jobId;
  final String shiftName;
  final DateTime shiftDateTime;

  final List<dynamic> userIds;

  ShiftModel(
      {this.shiftId,
      this.jobId,
      this.shiftName,
      this.shiftDateTime,
      this.userIds});
}
