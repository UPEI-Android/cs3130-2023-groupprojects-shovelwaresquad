import 'package:flutter/material.dart';
import 'search_view.dart';

class SearchPage extends StatelessWidget{
  final String passedString;
  const SearchPage({Key? key, required this.passedString}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SearchView(passedValue: passedString);
  }
}