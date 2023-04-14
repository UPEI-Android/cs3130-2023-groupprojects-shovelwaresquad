import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_keeper/listItem/listItem.dart';
import 'package:grocery_keeper/listItem/list_cubit.dart';

void main() {
  group('GKeeperListTest', ()
  {
    test('initial state is correct', () {
      final listCubit = ListCubit([ListItem('TestList', [])]);
      expect(listCubit.state,[ListItem('TestList', [])]);
    });

    test('state is correct after addList', () {
      final listCubit = ListCubit([ListItem('TestList', [])]);
      listCubit.addList('title', ['itemOne']);
      expect(listCubit.state,[ListItem('TestList', []), ListItem('title', ['itemOne'])]);
    });

    test('state is correct after addList and removeFromlist', () {
      final listCubit = ListCubit([ListItem('TestList', [])]);
      listCubit.addList('title', ['itemOne']);
      listCubit.removeFromList(listCubit.state[1], 0);
      expect(listCubit.state,[ListItem('TestList', []), ListItem('title', [])]);
    });

    test('state is correct after addList and addToList', () {
      final listCubit = ListCubit([ListItem('TestList', [])]);
      listCubit.addList('title', ['itemOne']);
      listCubit.removeFromList(listCubit.state[1], 0);
      listCubit.addToList(listCubit.state[0], 'entry');
      expect(listCubit.state,[ListItem('TestList', ['entry']), ListItem('title', [])]);
    });

  });
}
