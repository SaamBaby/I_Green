import 'dart:convert';

import 'package:Quete/models/appliedJobs.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AppliedJobs with ChangeNotifier {
  Map<String, AppliedJobsModel> _items = {};
  var authToken;

  AppliedJobs(this.authToken, this._items);

  Map<String, AppliedJobsModel> get items {
    fetchAppliedJobs();
    return {..._items};
  }

  Future<void> fetchAppliedJobs() async {
    final url =
        'https://igreen-458f7-default-rtdb.firebaseio.com/applied_jobs.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((id, appliedJobsData) {
        _items.putIfAbsent(
            appliedJobsData['jobId'],
            () => AppliedJobsModel(
                appliedDate: DateTime.parse(appliedJobsData['appliedDate']),
                id: id,
                jobId: appliedJobsData['jobId'],
                approvedDate: DateTime.parse(appliedJobsData['approvedDate']),
                isApproved: appliedJobsData['isApproved']));
        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
    ;
    notifyListeners();
  }

  Future<void> applyJob(String jobId) async {
    final url =
        'https://igreen-458f7-default-rtdb.firebaseio.com/applied_jobs.json?auth=$authToken';
    try {
      final value = await http.post(
        url,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'appliedDate': DateTime.now().toString(),
          'jobId': jobId,
          'approvedDate': DateTime.now().toString(),
          'isApproved': false
        }),
      );
      notifyListeners();
      print("testing ${json.decode(value.body)['name']}");
    } catch (error) {
      throw error;
    }

    notifyListeners();
  }

  int notApprovedJobsCount() {
    int count = 0;
    items.values.toList().forEach((element) {
      if (element.isApproved == false) {
        count = count + 1;
      }
    });
    return count;
  }

  int approvedJobsCount() {
    int count = 0;
    items.values.toList().forEach((element) {
      if (element.isApproved == true) {
        count += count;
      }
    });
    return count;
  }

  void approveJob(String jobId) {
    notifyListeners();
  }
}
