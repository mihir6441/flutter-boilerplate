import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/ui/posts/bloc/post_bloc.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';
import 'package:flutter_boilerplate/widgets/list_shimmer_page.dart';
import 'package:flutter_boilerplate/widgets/no_data_widget.dart';
import 'package:flutter_boilerplate/widgets/pagination_wrapper.dart';

import 'bloc/post_event.dart';
import 'bloc/post_state.dart';

class PostPageScreen extends StatefulWidget {
  const PostPageScreen({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider<PostBloc>(
      create: (_) => PostBloc()..add(PostListEvent()),
      child: const PostPageScreen(),
    );
  }

  @override
  State<PostPageScreen> createState() => _PostPageScreenState();
}

class _PostPageScreenState extends State<PostPageScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).fetchPosts),
          backgroundColor: AppStyles.greenColor,
          automaticallyImplyLeading: true,
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            switch (state.status) {
              case PostStatus.failure:
                return Center(
                    child: Text(
                  S.of(context).noDataFound,
                  style: AppStyles.errorTextStyle,
                ));
              case PostStatus.success:
                if (state.posts.isEmpty) {
                  return Center(
                      child: Text(
                    S.of(context).noDataFound,
                    style: AppStyles.whiteTextStyle,
                  ));
                }
                return PaginationWrapper(
                  isLoading: state.isLoading,
                  isEndReached: state.hasReachedMax,
                  onLoadMore: () {
                    context.read<PostBloc>().add(PostListEvent());
                  },
                  scrollableChild: ListView.separated(
                    padding: const EdgeInsets.only(
                        bottom: kFloatingActionButtonMargin + 10),
                    itemBuilder: (BuildContext context, int index) {
                      if (index >= state.posts.length) {
                        // show shimmer effect if we are loading
                        if (state.isLoading &&
                            state.status == PostStatus.initial) {
                          return const ListShimmerPage(
                            containerHeight: 80,
                          );
                        }

                        // show info message if the no items received
                        // for filter
                        if (state.posts.isEmpty) {
                          // Try to show message in center by adding
                          // some margins. Here we 450 is the assumed
                          // random height for top tabs + search widget
                          // so we can try to guess center spot
                          // double margin =
                          //     (screenSize(context).height -
                          //             450) /
                          //         2;

                          return NoDataWidget(
                            message: S.of(context).noDataFound,
                          );
                        }
                        return const SizedBox(
                          height: 40,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppStyles.primary500Color,
                            ),
                          ),
                        );
                      }
                      return Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppStyles.greenColor,
                            ),
                            //   color: AppStyles.blue900Color,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: ListTile(
                          leading: Text(
                            '${state.posts[index].id}',
                            style: AppStyles.bigTextStyle,
                          ),
                          title: Text(
                            state.posts[index].title ?? '',
                            style: AppStyles.bigTextStyle,
                          ),
                          isThreeLine: true,
                          subtitle: Text(
                            state.posts[index].body ?? '',
                            style: AppStyles.whiteTextStyle,
                          ),
                          dense: true,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: state.hasReachedMax
                        ? state.posts.length
                        : state.posts.length + 1,
                    // shrinkWrap: true,
                    //    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                  ),
                  bottomPadding: 10,
                );
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostListEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
