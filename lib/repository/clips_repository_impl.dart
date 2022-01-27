import 'package:flutter_boilerplate/api_client/app_graphql_client.dart';
import 'package:flutter_boilerplate/constants/app_constants.dart';
import 'package:flutter_boilerplate/constants/graphql_requests.dart';
import 'package:flutter_boilerplate/model/clips_api_models/clips_model.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'clips_repository.dart';

class ClipsRepositoryImpl extends ClipsRepository {
  final _appGraphQlClient = GetIt.I<AppGraphQlClient>();

  @override
  Future<ClipsModel> getClipsList(int page, int perPage) async {
    QueryResult result = await _appGraphQlClient.clientToQuery().query(
            QueryOptions(
                document: gql(GraphQlRequests.getClipsList),
                variables: {
              'perPage': AppConstants.itemsPerPage,
              'page': page,
            }));
    ClipsModel? data;
    if (!result.hasException) {
      data = ClipsModel.fromJson(result.data?['clips']);
      return data;
    }
    return data ?? ClipsModel();
  }
}
