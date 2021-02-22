import 'dart:convert';

import 'package:Quete/models/Job.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Jobs extends ChangeNotifier {
  Map<String, JobModel> _items = {};
  var authToken;

  Jobs(this.authToken, this._items);

  Map<String, JobModel> get items{
    return {..._items};
  }
  List<JobModel> get itemsList {
    fetchAvailableJobs();
    return {..._items}.values.toList();
  }

  Future<void> fetchAvailableJobs() async {
    final  url =
        'https://igreen-458f7-default-rtdb.firebaseio.com/available_jobs.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((id, appliedJobsData) {
        _items.putIfAbsent(id, () => JobModel(
          jobId: id,
          jobName: appliedJobsData['jobName'],
          jobDescription: appliedJobsData['jobDescription'],
          jobLocation: appliedJobsData['jobLocation'],
          jobLogo: appliedJobsData['jobLogo'],
          jobQualifications: appliedJobsData['jobQualifications'],
          jobSalary: double.parse(appliedJobsData['jobSalary']),
          jobResponsibilities: appliedJobsData['jobResponsibilities'],
          isContract: appliedJobsData['isContract'],
          isFullTime: appliedJobsData['isFullTime'],
          isUrgent: appliedJobsData['isUrgent'],
          isPartTime: appliedJobsData['isPartTime'],
          isFavourite: appliedJobsData['isFavourite'],
        ),);
        notifyListeners();
      });
    } catch (error) {
      print(error);
    };

    notifyListeners();
  }

  List<JobModel> get urgentJobs {
    return itemsList.where((element) => element.isUrgent).toList();
  }

  JobModel getJobById(String id) {
    return itemsList.firstWhere((element) => element.jobId == id);
  }

  void addJobs() {
//    _items.add(value);

    notifyListeners();
  }
}
