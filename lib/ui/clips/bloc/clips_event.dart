abstract class ClipsEvent {
  const ClipsEvent();
}

class ClipsListEvent extends ClipsEvent {
  final int? page;
  final int? perPage;

  ClipsListEvent(
      {required this.page,
        required this.perPage,});

}
