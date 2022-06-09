
import 'package:flutter/material.dart';
import 'package:sasto_wholesale/OurPartners/became_a_partner.dart';
import 'package:sasto_wholesale/OurPartners/partner_list.dart';


class Partners extends StatefulWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  _PartnersState createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        //elevation: 0.0,
        toolbarHeight: 70,
        title: Image.asset(
          "assets/images/logo.png",
          scale: 8,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/2.jpeg"),
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(1.0),
                      BlendMode.softLight),
                ),
              ),
              child: Center(
                  child: Text(
                    "Our Partners",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: DefaultTabController(
                  length: 2,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        TabBar(
                            indicatorColor: Colors.black,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding:
                            EdgeInsets.symmetric(horizontal: 20.0),
                            tabs: [
                              Container(
                                child: Tab(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Partners",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.0,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Tab(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Became Partners",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                        Expanded(
                          flex: 1,
                          child: TabBarView(
                            children: [
                              PartnerList(),
                              BecameAPartner()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
