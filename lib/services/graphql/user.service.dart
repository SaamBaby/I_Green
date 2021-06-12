import 'package:Quete/graphql/schema.dart';
import 'package:Quete/models/user/user.hive.model.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'client.graphql.service.dart';

class UserService extends ChangeNotifier {
  GraphQLClient _client;

  CurrentUser$QueryRoot$Users user;

  Future<void> init(GraphQLClient client, {bool shouldGetUser = false}) async {
    _client =  client ?? await IgreenGraphQLClient.getClient();
    if (shouldGetUser) await getUser();
  }

  Future<CurrentUser$QueryRoot$Users> getUser({FetchPolicy fetchPolicy = FetchPolicy.networkOnly, GraphQLClient graphQLClient}) async {
    _client = graphQLClient ?? _client;
    final options = QueryOptions(
        document: CurrentUserQuery().document, fetchPolicy: fetchPolicy);
    final result = await _client.query(options);
    if (result.hasException) {
      print(result.hasException.toString());
      return null;
    }
    final query = CurrentUser$QueryRoot.fromJson(result.data);
    user = query.users.single;
    UserCacheService.user =
        UserHive(id: user.userId, displayName: user.firstName);
    notifyListeners();
    return user;
  }

  Future<CreateUser$MutationRoot$InsertUsers> createUser(UsersInsertInput input, {GraphQLClient graphQLClient}) async {
    try {
      _client = graphQLClient ?? _client;
      final options = QueryOptions(
          document: CreateUserMutation().document,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: {'input': input.toJson()});

      final result = await _client.query(options);
      if (result.hasException) {
        print(
            "create user graphql exceptions${result.exception.graphqlErrors}");

        return null;
      }
      final response =
          CreateUser$MutationRoot.fromJson(result.data).insertUsers;
      return response;
    } catch (e) {
      print(e.toString());

      return CreateUser$MutationRoot$InsertUsers.fromJson({'success': false});
    }
  }

  Future<void> updateUser(UsersSetInput input, {GraphQLClient graphQLClient}) async {
    try {
      _client = graphQLClient ?? _client;
      final options = QueryOptions(
          document: UpdateUserMutation().document,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: {'input': input.toJson(), 'id': UserCacheService.user.id});

      final result = await _client.query(options);

      if (result.hasException) {
        print("update user graphql exceptions${result.exception}");

        return null;
      }
      final response = UpdateUser$MutationRoot$UpdateUsers.fromJson(result.data);
      updateUserCache(input);
      print("update user response data $response");

      return await getUser();
    } catch (e) {
      print(" user update errors${e.toString()}");

      return CreateUser$MutationRoot$InsertUsers.fromJson({'success': false});
    }
  }

  void updateUserCache(UsersSetInput input) {
    final cachedUser = UserCacheService.user;
    UserCacheService.user = UserHive(
        id: cachedUser.id,
        displayName: input.firstName ?? cachedUser.displayName,
        profilePictureUrl: input.profilePic ?? cachedUser.profilePictureUrl,
        email: cachedUser.email);

    notifyListeners();
  }

  Future<void> updateUserProfile(String imgUrl,
      {GraphQLClient graphQLClient}) async {
    _client = graphQLClient ??await IgreenGraphQLClient.getClient();
    final options = QueryOptions(
        document: UpdateProfilePicMutation().document,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {'imgUrl': imgUrl, 'id': UserCacheService.user.id});

    final result = await _client.query(options);

    if (result.hasException) {
      print("update user Profile  graphql exceptions${result.exception}");

      return null;
    }
    final response = UpdateProfilePic$MutationRoot$UpdateUsers.fromJson
      (result.data);
    print("update user response data $response");

  }
}
