import 'package:Quete/graphql/schema.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'client.graphql.service.dart';

class ActivityService extends ChangeNotifier{
List<GetAllActivities$QueryRoot$Activities> feed =[];
  // Todo please figure out this way of inserting if possible
  // Future<CreateActivity$MutationRoot$InsertActivitiesOne> createActivity(ActivitiesInsertInput input) async{
  //   try{
  //     GraphQLClient _client= await IgreenGraphQLClient.getClient();
  //     final options = QueryOptions(document: CreateActivityCloneMutation()
  //         .document, fetchPolicy: FetchPolicy.networkOnly, variables:
  //     {'input':input.toJson()});
  //
  //     final result = await _client.query(options);
  //
  //     if(result.hasException){
  //       print(" create activity exceptions${ result.exception.toString()}");
  //       return null;
  //     }
  //     final response = CreateActivity$MutationRoot.fromJson(result.data).insertActivitiesOne;
  //     print(" create activity  response${ response.activityId}");
  //     return response;
  //   }
  //   catch(e){
  //     print(e.toString());
  //     return CreateActivity$MutationRoot$InsertActivitiesOne.fromJson
  //       ({'success': false});
  //
  //   }
  //
  // }

  void getActivities() async {
    final _client = await IgreenGraphQLClient.getClient();
    final options=QueryOptions(document: GetAllActivitiesQuery().document,
        fetchPolicy: FetchPolicy.networkOnly );
    final result= await _client.query(options);
    if(result.hasException){
      print("get all activities error${ result.exception.toString()}");
      if(result.data==null)return null;
    }

    final query=GetAllActivities$QueryRoot.fromJson(result.data);
    feed=query.activities;
    print("get all activities result${feed.first.shift}");

  }
  Future<CreateActivity$MutationRoot$InsertActivitiesOne> createActivity(
      String activityId,int shiftId, String userId, bool isAccepted) async{
    try{
      GraphQLClient _client= await IgreenGraphQLClient.getClient();
      final options = QueryOptions(document: CreateActivityMutation().document, fetchPolicy: FetchPolicy.networkOnly, variables: {
        'activityId': activityId,'shiftId': shiftId,'userId': userId,'isAccepted': isAccepted
      });

      final result = await _client.query(options);

      if(result.hasException){
        print(" create activity exceptions${ result.exception.toString()}");
        return null;
      }
      final response = CreateActivity$MutationRoot.fromJson(result.data)
          .insertActivitiesOne;
      print(" create activity  response${ response.activityId}");
      return response;
    }
    catch(e){
      print(e.toString());
      return CreateActivity$MutationRoot$InsertActivitiesOne.fromJson
        ({'success': false});

    }

  }





}