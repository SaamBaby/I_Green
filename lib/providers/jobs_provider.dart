import 'dart:convert';

import 'package:Quete/models/Job.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Jobs extends ChangeNotifier {
  List<JobModel> loadedAppliedJobs = [];
  List<JobModel> _items = [];

  List<JobModel> get items {
    return [..._items];
  }

  Future<void> fetchAppliedJobs() async {
    const url =
        'https://igreen-458f7-default-rtdb.firebaseio.com/available_jobs.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      print(response.statusCode);

      extractedData.forEach((id, appliedJobsData) {
        _items.add(
          JobModel(
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
          ),
        );
        notifyListeners();
      });
    } catch (error) {
      print(error);
    };

    notifyListeners();
  }

  List<JobModel> get urgentJobs {
    return _items.where((element) => element.isUrgent).toList();
  }

  JobModel getJobById(String id) {
    return _items.firstWhere((element) => element.jobId == id);
  }

  void addJobs() {
//    _items.add(value);

    notifyListeners();
  }
}
