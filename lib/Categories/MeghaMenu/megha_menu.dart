import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/sub_category.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/Categories/MeghaMenu/megha_menu_model.dart';


class MeghaMenu extends StatefulWidget {
  const MeghaMenu({Key? key}) : super(key: key);

  @override
  _MeghaMenuState createState() => _MeghaMenuState();
}

class _MeghaMenuState extends State<MeghaMenu> {
  late Future <List<MeghaMenuModel>>? meghamenuItem;

  @override
  void initState() {
    super.initState();
    meghamenuItem = fetchMeghaMenuItem();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      child: Container(
        height: 140,
        child: FutureBuilder<List<MeghaMenuModel>>(
          future: meghamenuItem,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MeghaMenuModel> _menuItem = snapshot.data!;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _menuItem.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // if(_items[index].name == "Rfq") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              new SubCategoryMeghaMenu(categoryId: _menuItem[index].id)));
                      //   }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        // color: Colors.tealAccent,
                        child: Column(
                          children: [
                            Material(
                              elevation: 1,
                              borderRadius: BorderRadius.circular(35),
                              child: Container(
                                height: 70,
                                width: 70,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                      _menuItem[index].imageUrl.toString()
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                _menuItem[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(width: 5),
              );

            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  // backgroundColor: Colors.grey,
                  //color: Colors.purple,
                  // valueColor: ,
                )
            );
          },
        ),
      ),
    );
  }
}


Future<List<MeghaMenuModel>> fetchMeghaMenuItem() async {
  final response = await http
      .get(Uri.parse('https://seller.sastowholesale.com/api/megamenu'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new MeghaMenuModel.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Menu Item');
  }
}


