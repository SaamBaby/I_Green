import 'package:flutter/cupertino.dart';

class AppliedJobsModel{
  final String id;
  final String jobId;
  final DateTime appliedDate;
  final DateTime approvedDate;
  bool isApproved;

  AppliedJobsModel(
      { @required this.id,
        @required this.jobId,
        @required this.appliedDate,
        @required  this.isApproved,
        this.approvedDate
      });
}
