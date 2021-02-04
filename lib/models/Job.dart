import 'package:flutter/material.dart';

class JobModel  with ChangeNotifier{
  final String jobId;
  final String jobName;
  final String jobDescription;
  final String jobResponsibilities;
  final String jobQualifications;
  final String jobLocation;
  final String jobLogo;
  final bool isPartTime;
  final bool isFullTime;
  final bool isContract;
  final bool isUrgent;
  final double jobSalary;
   bool isFavourite;

  JobModel(
      {
      this.jobId,
      this.isFavourite=false,
      this.jobName,
      this.jobDescription,
      this.jobResponsibilities,
      this.jobQualifications,
      this.jobLocation,
      this.jobLogo,
      this.isPartTime,
      this.isFullTime,
      this.isContract,
      this.isUrgent,
      this.jobSalary});
  void toggleFavoriteStatus(){
    isFavourite=!isFavourite;
    notifyListeners();
  }
}
