
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_keeper/home/view/gkeeper_home_view.dart';
import 'package:web_scraper/web_scraper.dart';

import '../home/cubit/gkeeper_home_cubit.dart';
import '../listItem/listItem.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SearchView();

}

class _SearchView extends State<SearchView> {
  final webScraper = WebScraper('https://www.walmart.ca');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>>? productNames;
  List<Map<String, dynamic>>? productImgs;
  List<Map<String, dynamic>>? productPrices;

  void fetchProducts(String searchTerm) async {
    // Loads web page and downloads into local state of library
    if (await webScraper
        .loadWebPage('/search?q=$searchTerm&f=70011')) {
      setState(() {
        productNames = webScraper.getElement(
            'div.css-3ky18c.epettpn0 > a.css-770c6j.epettpn1', ['href', 'aria-label']);
        productImgs = webScraper.getElement('div.css-3ky18c.epettpn0 > a.css-770c6j.epettpn1 > '
            'div.css-ybbenb.epettpn8 > div.css-1om82h.epettpn3 > '
            'img.css-19q6667.e175iya62', ['src']);
        print(productNames);
        print(productImgs);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing start
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GkeeperHomeCubit, GkeeperHomeState>(
        builder: (context, state) {
          var lState = state as GKeeperItemSelected;
          fetchProducts(lState.item);
          return Scaffold(
              appBar: AppBar(
                title: const Text('Search Page'),
              ),
              body: Container(
                  child: productNames == null ? const Center(
                    child:
                    CircularProgressIndicator(), // Loads Circular Loading Animation
                  ) :
                  productNames!.isEmpty ? const Center(
                      child: Text("Sorry! An error has occurred :("))
                      : ListView.builder(

                      itemCount: productNames!.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Attributes are in the form of List<Map<String, dynamic>>.
                        Map<String, dynamic> attributes =
                        productNames![index]['attributes'];
                        var lState = state as GKeeperListSelected;
                        ListItem list = lState.list;
                        return InkWell(
                            child: Column(
                              children: [
                                FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                        attributes['aria-label'] ?? "")),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10.0),
                                        child: Image.network(
                                            productImgs![index]['attributes']['src'] ??
                                                ""), //productPrice![index]['title']),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            list.contents.add(
                                                attributes['aria-label']);
                                          });
                                        },
                                        child: const Text(
                                          'Add to List',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                        );
                      }
                  )
              )
          );
        }
    );
  }
}