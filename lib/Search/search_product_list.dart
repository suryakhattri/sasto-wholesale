import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:sasto_wholesale/Search/search_api.dart';
import 'package:sasto_wholesale/Search/search_widget.dart';
import 'package:sasto_wholesale/TopProducts/top_product_all_item_model.dart';

class SearchProductList extends StatefulWidget {
  const SearchProductList({Key? key}) : super(key: key);

  @override
  _SearchProductListState createState() => _SearchProductListState();
}

class _SearchProductListState extends State<SearchProductList> {
  List<TopProductData> products = [];
  String q = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final products = await SearchProductsApi.searchProductList(q);

    setState(() => this.products = products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[200],
        elevation: 1.0,
        toolbarHeight: 70,
        title: Text(
          "Search Products",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                //  _scaffoldState.currentState.openDrawer();
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final book = products[index];

                return buildBook(book);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: q,
        hintText: 'Search for desired product here',
        onChanged: searchProducts,
      );

  Future searchProducts(String q) async => debounce(() async {
        final products = await SearchProductsApi.searchProductList(q);

        if (!mounted) return;

        setState(() {
          this.q = q;
          this.products = products;
        });
      });

  Widget buildBook(TopProductData data) => Padding(
    padding: const EdgeInsets.only(left:10.0, right: 10.0, bottom: 1.0, top: 1.0),
    child: InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                new ProductDetailPage(slug: data.slug,)));
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
              leading: Image.network(
                data.imageUrl,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              title: Text(data.title),
              //subtitle: Text(data.price ?? "default"),
            ),
      ),
    ),
  );
}
