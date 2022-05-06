import 'package:flutter/material.dart';
import 'package:sasto_wholesale/Profile/Model/product_information.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() =>
      _DetailsScreenState(subtitle: "", title: "");
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String title;
  final String subtitle;

  _DetailsScreenState({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final userOrder = [
      _DetailsScreenState(
        title: "Vendor Name",
        subtitle: "	Lednesy Util",
      ),
      _DetailsScreenState(
        title: "Date",
        subtitle: "09-Otc-2020",
      ),
      _DetailsScreenState(
        title: "Invoice",
        subtitle: "	1272937847",
      ),
      _DetailsScreenState(
        title: "Warrenty Certificate",
        subtitle: "DWTOSMDTE",
      ),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "Details Content",
              style: TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Divider(
            endIndent: 0,
            indent: 0,
            thickness: 0.5,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          _orderContent(),
          SizedBox(
            height: 10,
          ),
          _buyerInformation(),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "Product Information",
              style: TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Divider(
            endIndent: 0,
            indent: 0,
            thickness: 0.5,
            color: Colors.black,
          ),
          ProductInformation(),
        ],
      ),
    );
  }

  Widget _orderContent() {
    final userOrder = [
      _DetailsScreenState(
        title: "Vendor Name",
        subtitle: "	Lednesy Util",
      ),
      _DetailsScreenState(
        title: "Date",
        subtitle: "09-Otc-2020",
      ),
      _DetailsScreenState(
        title: "Invoice",
        subtitle: "	1272937847",
      ),
      _DetailsScreenState(
        title: "Warrenty Certificate",
        subtitle: "DWTOSMDTE",
      ),
    ];
    return Column(
      children: [
        ListTile(
          tileColor: Colors.grey.shade200,
          leading: Text(
            "Order #897r987942",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
            textAlign: TextAlign.left,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: userOrder.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  userOrder[index].title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
                trailing: Text(
                  userOrder[index].subtitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
              );
            })
      ],
    );
  }

  Widget _buyerInformation(){
    final userOrder = [
      _DetailsScreenState(
        title: "Nearest Landmark",
        subtitle: "",
      ),
      _DetailsScreenState(
        title: "Phone Number",
        subtitle: "9852364585",
      ),
      _DetailsScreenState(
        title: "Vat/Pan",
        subtitle: "	12729",
      ),
    ];
    return Column(
      children: [
        ListTile(
          tileColor: Colors.grey.shade200,
          leading: Text(
            "Buyer Information",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
            textAlign: TextAlign.left,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: userOrder.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  userOrder[index].title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
                trailing: Text(
                  userOrder[index].subtitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
              );
            })
      ],
    );
  }
  
}

class ProductInformation extends StatefulWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  _ProductInformationState createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  List<Employee> _employees = <Employee>[];
  late EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
  }

  List<Employee> getEmployeeData() {
    return [
      Employee("1", 'LCD Screen', "${230}", "1", "${230}", ),
      Employee("2", 'Samsung Galaxy', "${230}", "1", "${230}", ),
      Employee("3", 'Pant', "${230}", "1", "${230}",),
      // Employee("ADBl", '420', "421", "1", "0.24%",),
      // Employee("ADBl", '420', "421", "1", "0.24%", ),
      // Employee("ADBl", '420', "421", "1", "0.24%", ),
      // Employee("ADBl", '420', "421", "1", "0.24%",),
      // Employee("ADBl", '420', "421", "1", "0.24%", ),
      // Employee("ADBl", '420', "421", "1", "0.24%",),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 200,
      color: Colors.grey.shade200,
      height: MediaQuery.of(context).size.height,
      child: SfDataGrid(
        allowSwiping: true,
        swipeMaxOffset: 100.0,
        source: _employeeDataSource,
        // endSwipeActionsBuilder: (BuildContext context, DataGridRow row) {
        //   return GestureDetector(
        //     onTap: () {
        //       // _employeeDataSource.dataGridRows.insert(
        //       //     _employeeDataSource.dataGridRows.indexOf(row),
        //       //     DataGridRow(cells: [
        //       //       DataGridCell(value: 1011, columnName: 'id'),
        //       //       DataGridCell(value: 'Tom Bass', columnName: 'name'),
        //       //       DataGridCell(value: 'Developer', columnName: 'designation'),
        //       //       DataGridCell(value: 20000, columnName: 'salary')
        //       //     ]));
        //       // _employeeDataSource.updateDataSource();
        //     },
        //     child: Row(
        //       children: [
        //         Container(
        //           color: Colors.red,
        //           child: Center(
        //             child: IconButton(icon: Icon(Icons.edit_location_rounded, color: Colors.white,), onPressed: (){}, ),
        //           ),
        //         ),
        //
        //         Container(
        //           color: Colors.red,
        //           child: Center(
        //             child: IconButton(icon: Icon(Icons.delete, color: Colors.white,), onPressed: (){}, ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // },
        columnWidthMode: ColumnWidthMode.fill,
        columns: [
          GridTextColumn(
              columnName: 'symbol',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.center,
                  child: Text(
                    '#',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    //   overflow: TextOverflow.ellipsis,
                  ))),
          GridTextColumn(
              columnName: 'productName',
              label: Container(
                //  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Product Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridTextColumn(
              columnName: 'price',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Price',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridTextColumn(
              columnName: 'quantity',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridTextColumn(
              columnName: 'total',
              label: Container(
                // padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ))),
          // GridTextColumn(
          //     columnName: 'alert',
          //     label: Container(
          //       // padding: EdgeInsets.symmetric(horizontal: 16.0),
          //         alignment: Alignment.center,
          //         child: Text(
          //           'Alert',
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold, fontSize: 16),
          //           overflow: TextOverflow.ellipsis,
          //         ))),
        ],
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(
        columnName: '#', value: dataGridRow.symbol,),
      DataGridCell<String>(columnName: 'Product Name', value: dataGridRow.product_name),
      DataGridCell<String>(columnName: 'Price', value: dataGridRow.price),
      DataGridCell<String>(columnName: 'Quantity', value: dataGridRow.quantity),
      DataGridCell<String>(
          columnName: 'Total', value: dataGridRow.total),
     // DataGridCell(columnName: 'alert'),
    ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.white,
        cells: row.getCells().map<Widget>((dataGridCell) {
          // if (dataGridCell.columnName == 'alert') {
          //   return IconButton(icon: Icon(Icons.notifications_off), onPressed: (){});
          // }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                alignment: (dataGridCell.columnName == 'symbol' ||
                    dataGridCell.columnName == 'productName')
                    ? Alignment.center
                    : Alignment.center,
                //padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  dataGridCell.value.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                )),
          );
        }).toList());
  }
}


