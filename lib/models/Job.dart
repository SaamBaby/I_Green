import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobModel  with ChangeNotifier{
  var authToken;
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
        this.authToken,
      this.jobId,
      this.isFavourite= false,
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
  void toggleFavoriteStatus(String id) async{
    final oldFavourite= isFavourite;
    isFavourite=!isFavourite;
    notifyListeners();
    print("authchecking$authToken");
    final  url = 'https://igreen-458f7-default-rtdb.firebaseio.com/available_jobs/$id.json?auth=$authToken';
    try{
      await http.patch(url,body:json.encode({
        'isFavourite':isFavourite
      }),
        

    ).then((value) => {print(value.body)});
      print(isFavourite);
    }
    catch(error){
      isFavourite=oldFavourite;
      print(error);
    }
  }
}
