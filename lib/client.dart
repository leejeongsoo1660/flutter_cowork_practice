import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cowork_practice/api.dart';
import 'package:flutter_cowork_practice/login/token/token_cubit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class Client {
  Client({
    required String origin,
    required this.tokenCubit,
  }) {
    authLink = AuthLink(
      getToken: () => tokenCubit.state.accessToken,
    );
    link = authLink.concat(httpLink);

    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.networkOnly),
      ),
    );
  }

  final httpLink = HttpLink('http://buildpay.co.kr');
  final TokenCubit tokenCubit;
  late final AuthLink authLink;
  late final Link link;
  late final GraphQLClient client;

// final result = await mutate(
//   MutationOptions(
//     document:
     
//     ),
//   );

  // final readRespositioriesResult = useQuery(
  //   QueryOptions(
  //     document: gql(getPostByID), // document : 쿼리문을 포함하고 있는 필수 인자
  //     variables: {
  //       // variables: 쿼리문에 필요한 변수들을 넣어주는 곳
  //       'nRepositories ': 20,
  //     },

  //     // pollInterval: const Duration(seconds: 3), // 쿼리를 계속해서 특정 시간마다 refetch해야 할 경우 쓰는 것
  //   ),
  // );
  // final createPostMutaion = useMutation(
  //   MutationOptions(
  //       document: gql(createPost),
  //       update: (cache, result) => result,
  //       onCompleted: (data) {
  //         Text('d');
  //       }),
  // );

  void clientQuery() {
    client.query(QueryOptions(document: gql(getPostByID)));
  }
}

void clientMutation() {

}
