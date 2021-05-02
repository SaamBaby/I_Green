import 'package:Quete/graphql/schema.dart';
import 'package:graphql/client.dart';

import 'client.graphql.service.dart';

class ActivityService{


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

  Future<CreateActivity$MutationRoot$InsertActivitiesOne> createActivity( int
  activityId,int shiftId, String userId, bool isAccepted) async{
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
      final response = CreateActivity$MutationRoot.fromJson(result.data).insertActivitiesOne;
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