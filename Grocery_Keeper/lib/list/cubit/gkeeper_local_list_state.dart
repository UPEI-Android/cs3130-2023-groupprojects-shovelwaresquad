part of 'gkeeper_local_list_cubit.dart';

enum ListStatus {loading, loaded, error}

class GKeeperLocalListState extends Equatable {

  final List<GKeeperListRecord> lists;
  final ListStatus status;

  const GKeeperLocalListState({
    this.status = ListStatus.loading,
    this.lists = const<GKeeperListRecord> []
  });

  GKeeperLocalListState copyWith({
    ListStatus? status,
    List<GKeeperListRecord>? lists,
  })
  {
    return GKeeperLocalListState(
      status: status ?? this.status,
      lists: lists ?? this.lists,
    );
  }

  @override
  List<Object> get props => [status, lists];

  @override
  bool? get stringify => true;
}


