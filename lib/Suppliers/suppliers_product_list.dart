import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';

class SuppliersProductList extends StatefulWidget {
  const SuppliersProductList({Key? key}) : super(key: key);

  @override
  _SuppliersProductListState createState() => _SuppliersProductListState();
}

class _SuppliersProductListState extends State<SuppliersProductList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text(
          "Kathmandu Fancy",
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
      //backgroundColor: Color.fromARGB(255, 98, 134, 166),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: Container(
                  // color: Color.fromARGB(255, 98, 134, 166),
                  color: Colors.grey[200],
                  child: GridView.builder(
                      physics: ScrollPhysics(),
                      itemCount: 7,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) => SuppliersProductItem()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuppliersProductItem extends StatelessWidget {
  const SuppliersProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //         new ProductDetailPage(slug: ,)));
      },
      child: Material(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //  SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                // height: 160,
                // width: 300,
                decoration: BoxDecoration(
                  // color: Colors.deepPurple
                ),
                child: Image.asset(
                  'assets/images/iphone.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Container(
                // width: 220,
                child: Text(
                    "fall winter hodie casual patchwork hood pullover sweatshirts custom new style",
                    style: TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.normal),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
              //child: Text("The bibal is a catholic book",  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 20.0),
              child: Text(
                "Rs: 1400 - 1500",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 20.0),
              child: Text(
                "100 pcs (Min. order)",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}

