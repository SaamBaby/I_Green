

import 'package:Quete/graphql/schema.graphql.dart';
import 'package:Quete/services/cache/user.cache.service.dart';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'client.graphql.service.dart';

class DiscoveryService extends ChangeNotifier {
  List<GetAllClosedShifts$QueryRoot$ClosedShifts> feed = [];


  void getShifts() async {
    GraphQLClient client= await IgreenGraphQLClient.getClient();
    final options = QueryOptions(document: GetAllClosedShiftsQuery().document,   fetchPolicy: FetchPolicy.networkOnly);
    final result = await client.query(options);

    if (result.hasException) {
      print(result.exception.graphqlErrors.toString());
      debugPrint(result.exception.graphqlErrors.toString(), wrapWidth: 5000);
      if (result.data == null) return null;
    }

    final query = GetAllClosedShifts$QueryRoot.fromJson(result.data);



    feed = query.closedShifts;
    notifyListeners();

  }


  // ger all open shifts
  void getOpenShifts() async {
    GraphQLClient client= await IgreenGraphQLClient.getClient();
    final options = QueryOptions(document: GetAllClosedShiftsQuery().document,   fetchPolicy: FetchPolicy.networkOnly);
    final result = await client.query(options);

    if (result.hasException) {
      print(result.exception.graphqlErrors.toString());
      debugPrint(result.exception.graphqlErrors.toString(), wrapWidth: 5000);
      if (result.data == null) return null;
    }

    final query = GetAllClosedShifts$QueryRoot.fromJson(result.data);



    feed = query.closedShifts;
    notifyListeners();

  }

  void deleteCloseShift(int closedShiftId) async {
    GraphQLClient client= await IgreenGraphQLClient.getClient();
    final options = QueryOptions(document: DeleteClosedShiftMutation()
        .document, variables:{'id':closedShiftId}, fetchPolicy:
        FetchPolicy.networkOnly);
    final result = await client.query(options);

    if (result.hasException) {
      print(" delete closed shift response ${result.exception.graphqlErrors.toString()}");
      // debugPrint(result.exception.graphqlErrors.toString(), wrapWidth: 5000);
      if (result.data == null) return null;
    }
    final response = DeleteClosedShift$MutationRoot.fromJson(result.data);
    print(" delete closed shift response ${ response.deleteClosedShifts}");
    notifyListeners();

  }
  Future<CreateOpenShift$MutationRoot$InsertOpenShifts> createOpenShift
      (String openShiftId, int shiftId )async{
    GraphQLClient client= await IgreenGraphQLClient.getClient();
    final options = QueryOptions(document: CreateOpenShiftMutation()
        .document, variables: {'openShiftId':openShiftId,'shiftId':shiftId},
        fetchPolicy: FetchPolicy.networkOnly);
    final result = await client.query(options);
    if(result.hasException){
      print(" delete closed shift response ${result.exception.graphqlErrors.toString()}");
      if (result.data == null) return null;
    }
    final response = CreateOpenShift$MutationRoot.fromJson(result.data).insertOpenShifts;
    print(" create open shift  response${ response.returning.first
        .openShiftsId}");
    return response;



  }

}