part of 'gkeeper_home_cubit.dart';

@immutable
abstract class GkeeperHomeState {
  const GkeeperHomeState();
}

class GkeeperHomeInitial extends GkeeperHomeState {
  const GkeeperHomeInitial();
}

class GKeeperListSelected extends GkeeperHomeState {
  final ListItem list;
  final int num;
  const GKeeperListSelected(this.list, this.num);
}

