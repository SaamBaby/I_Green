

import 'package:Quete/graphql/schema.graphql.dart';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'client.graphql.service.dart';

class DiscoveryService extends ChangeNotifier {
  List<GetAllClosedShifts$QueryRoot$ClosedShifts> feed = [];


  void getPosts(String id, ) async {
    GraphQLClient client= await IgreenGraphQLClient.getClient();
    final options = QueryOptions(document: GetAllClosedShiftsQuery().document,
        variables: {'userid': id},   fetchPolicy: FetchPolicy.networkOnly);
    final result = await client.query(options);

    if (result.hasException) {
      debugPrint(result.exception.graphqlErrors.toString(), wrapWidth: 5000);
      if (result.data == null) return null;
    }

    final query = GetAllClosedShifts$QueryRoot.fromJson(result.data);

    print(result.data);

    feed = query.closedShifts;
    notifyListeners();

  }

}