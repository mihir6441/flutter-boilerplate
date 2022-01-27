import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/constants/app_colors.dart';
import 'package:flutter_boilerplate/constants/app_constants.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/ui/clips/bloc/clips_bloc.dart';
import 'package:flutter_boilerplate/ui/clips/bloc/clips_event.dart';
import 'package:flutter_boilerplate/ui/clips/bloc/clips_state.dart';
import 'package:flutter_boilerplate/ui/posts/bloc/post_bloc.dart';
import 'package:flutter_boilerplate/ui/posts/bloc/post_event.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';
import 'package:flutter_boilerplate/widgets/list_shimmer_page.dart';
import 'package:flutter_boilerplate/widgets/no_data_widget.dart';
import 'package:flutter_boilerplate/widgets/pagination_wrapper.dart';

class ClipsListScreen extends StatefulWidget {
  const ClipsListScreen({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider<ClipsBloc>(
      create: (_) => ClipsBloc()
        ..add(ClipsListEvent(perPage: AppConstants.itemsPerPage, page: 0)),
      child: const ClipsListScreen(),
    );
  }

  @override
  State<ClipsListScreen> createState() => _ClipsListScreenState();
}

class _ClipsListScreenState extends State<ClipsListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ClipsBloc, ClipsState>(
      builder: (context, state) {
        print(state.clips!.length);
        switch (state.status) {
          case ClipStatus.failure:
            return Center(
                child: Text(S.of(context).noDataFound,
                    style: const TextStyle(color: Colors.white)));
          case ClipStatus.success:
            if (state.clips!.isEmpty) {
              return Center(
                  child: Text(
                S.of(context).noDataFound,
                style: const TextStyle(color: Colors.white),
              ));
            }
            return PaginationWrapper(
              isLoading: state.isLoading,
              isEndReached: state.hasReachedMax,
              onLoadMore: () {
                context.read<ClipsBloc>().add(ClipsListEvent(
                    perPage: AppConstants.itemsPerPage,
                    page: state.clipResponse!.pagination!.currentPage! + 1));
              },
              scrollableChild: ListView.separated(
                padding: const EdgeInsets.only(
                    bottom: kFloatingActionButtonMargin + 10),
                itemBuilder: (BuildContext context, int index) {
                  if (index >= state.clips!.length) {
                    // show shimmer effect if we are loading
                    if (state.isLoading && state.status == ClipStatus.initial) {
                      return const ListShimmerPage(
                        containerHeight: 80,
                      );
                    }

                    // show info message if the no items received
                    // for filter
                    if (state.clips!.isEmpty) {
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
                            color: AppColors.color8,
                          ),
                          color: AppColors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.network(
                              state.clips![index].screenshot ?? ' ',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              state.clips![index].description ?? 'Description',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ))
                        ],
                      ));
                },
                separatorBuilder: (context, index) {
                  return Container();
                },
                itemCount: state.hasReachedMax
                    ? state.clips!.length
                    : state.clips!.length + 1,
                // shrinkWrap: true,
                //    controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
              ),
              bottomPadding: 10,
            );
          default:
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
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
