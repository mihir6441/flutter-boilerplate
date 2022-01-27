import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';

class AppGraphQlClient {
  GraphQLClient? _client;
  final HttpLink httpLink = HttpLink(
    'https://baba-api-v2.preview.im/graphql/open',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  //final Link link = authLink.concat(httpLink);
  AppGraphQlClient() {
    _client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
        watchQuery: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
      //  link: authLink.concat(httpLink),
      link: httpLink,
    );
  }


  GraphQLClient clientToQuery() {
    return _client!;
  }

  Stream<Map<String, dynamic>> queryString(String query,
      {required Map<String, dynamic> variables}) {
    return _client!
        .query(QueryOptions(document: gql(query), variables: variables))
        .asStream()
        .map((result) {
      print('//// exception: $query,$result,${result.exception?.toString()}');
      if (result.exception != null) {
        print('//// exception: ${result.exception?.toString()}');
      }
      print('//// exception: ${result.data!}');
      return result.data!; //.data;
    });
  }

  String _getErrorMessage(OperationException exception, bool isQuery) {
    if (exception.linkException != null) {
      final error = exception.linkException;
      if (error is NetworkException && error.message is SocketException) {
        return 'No internet connection';
      }
    }
    if (exception.graphqlErrors.isNotEmpty == true) {
      final message = exception.graphqlErrors[0].message;
      if ('validation' == message) {
        final error = exception.graphqlErrors[0].extensions;
        if (error is Map && error!.containsKey('fields')) {
          final fields = error['fields'];
          if (fields is Map && fields.isNotEmpty) {
            final firstError = fields[fields.keys.toList()[0]];
            if (firstError is List && firstError.isNotEmpty) {
              return firstError[0].toString();
            }
          }
        }
      }
      return message;
    }
    return 'Error!!!';
  }
}
