import 'package:flutter/material.dart';

typedef OnLoadMore = void Function();

class PaginationWrapper extends StatefulWidget {
  final Widget scrollableChild;
  final bool isLoading;
  final bool isEndReached;
  final OnLoadMore onLoadMore;
  final double bottomPadding;

  const PaginationWrapper({
    Key? key,
    required this.scrollableChild,
    this.isLoading = false,
    this.isEndReached = false,
    required this.onLoadMore,
    this.bottomPadding = 0,
  }) : super(key: key);

  @override
  _PaginationWrapperState createState() => _PaginationWrapperState();
}

class _PaginationWrapperState extends State<PaginationWrapper> {
  bool _isLoading = false;
  bool _isEndReached = false;

  @override
  Widget build(BuildContext context) {
    _isLoading = widget.isLoading;
    _isEndReached = widget.isEndReached;

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (!_isEndReached &&
            !_isLoading &&
            scrollNotification.metrics.pixels >=
                (scrollNotification.metrics.maxScrollExtent -
                    widget.bottomPadding)) {
          _isLoading = true;
          widget.onLoadMore.call();
        }
        return true;
      },
      child: widget.scrollableChild,
    );
  }
}
