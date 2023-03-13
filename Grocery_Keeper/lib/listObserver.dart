import 'package:bloc/bloc.dart';

/// {@template counter_observer}
/// [BlocObserver]
/// observes all state changes.
/// {@endtemplate}
class ListObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}