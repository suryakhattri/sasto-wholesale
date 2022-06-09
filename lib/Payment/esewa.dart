import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:sasto_wholesale/cart/cart_provider.dart';

// class EsewaEpay extends StatefulWidget {
//   @override
//   _TestPageState createState() => _TestPageState();
// }
//
// class _TestPageState extends State<EsewaEpay> {
//  // Completer<WebViewController> _controller = Completer<WebViewController>();
//   late WebViewController _webViewController;
//
//  // String testUrl = "https://pub.dev/packages/webview_flutter";
//
//   _loadHTMLfromAsset() async {
//     String file = await rootBundle.loadString("assets/epay_request.html");
//     _webViewController.loadUrl(Uri.dataFromString(file,
//         mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
//         .toString());
//   }
//
//   // ePay deatils
//   double tAmt = 1000;
//   double amt = 800;
//   double txAmt = 100;
//   double psc = 50;
//   double pdc = 50;
//   String scd = "EPAYTEST";
//   String su = "https://github.com/kaledai";
//   String fu = "https://refactoring.guru/design-patterns/factory-method";
//
//   @override
//   void initState() {
//     super.initState();
//     // Enable hybrid composition.
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartItemData>(context);
//    // double tamt = cart.totalPrice;
//
//
//
//     return Scaffold(
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(() {
//       //       String pid = UniqueKey().toString();
//       //       _webViewController.evaluateJavascript(
//       //           'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid", su = "$su", fu = "$fu")');
//       //     });
//       //   },
//       //   child: Icon(Icons.add),
//       // ),
//       appBar: AppBar(
//         leading: SizedBox.shrink(),
//       ),
//       body: WebView(
//         initialUrl: "about:blank",
//         javascriptMode: JavascriptMode.unrestricted,
//         javascriptChannels: Set.from([
//           JavascriptChannel(
//             name: "message",
//             onMessageReceived: (message) {},
//           ),
//         ]),
//         onPageFinished: (data) {
//           setState(() {
//             String pid = UniqueKey().toString();
//             _webViewController.evaluateJavascript(
//                 'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid",su = "$su", fu = "$fu")');
//           });
//         },
//         onWebViewCreated: (webViewController) {
//           // _controller.complete(webViewController);
//           _webViewController = webViewController;
//           _loadHTMLfromAsset();
//         },
//       ),
//     );
//   }
// }

class EsewaPayment extends StatefulWidget {
  const EsewaPayment({Key? key}) : super(key: key);

  @override
  _EsewaPaymentState createState() => _EsewaPaymentState();
}

class _EsewaPaymentState extends State<EsewaPayment> {

  late ESewaPnp _esewaPnp;
  late ESewaConfiguration _configuration;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _configuration = ESewaConfiguration(
      clientID: "JxZFIwkWSyccFgdfGRQfBw==",
      secretKey: "BhwIWQMWHw0cBxYWA08ADw5X",
      environment: ESewaConfiguration.ENVIRONMENT_LIVE,
    );
    _esewaPnp = ESewaPnp(configuration: _configuration);
  }

  double _amount = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Esewa Payment"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Transaction Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight
                      .bold, color: Colors.black),),
                ListTile(
                  leading: Text(
                    "Be The Best", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),
                  trailing: Text(
                    "NPR", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),
                ),
                Divider(thickness: 0.5,color: Colors.black,),
                ListTile(
                  leading: Text(
                    "Product Amount:", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                  trailing: Text(
                    cart.totalPrice.toString(), style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                ),
                Divider(thickness: 0.5,color: Colors.black,),
                ListTile(
                  leading: Text(
                    "Tax Amount:", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                  trailing: Text(
                    "0.00", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                ),
                Divider(thickness: 0.5,color: Colors.black,),
                ListTile(
                  leading: Text(
                    "Service Charge:", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                  trailing: Text(
                    "0.00", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                ),
                Divider(thickness: 0.5,color: Colors.black,),
                ListTile(
                  leading: Text(
                    "Delivery Charge:", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                  trailing: Text(
                    "0.00", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                ),
                ListTile(
                  tileColor: Colors.grey.shade200,
                  leading: Text(
                    "Total Amount:", style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),
                  trailing: Text(
                    cart.totalPrice.toString(), style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),
                ),

                SizedBox(
                  height: 16,
                ),
                ESewaPaymentButton(
                  this._esewaPnp,
                  amount: cart.totalPrice,
                  callBackURL: "https://example.com",
                  productId: "abc123",
                  productName: "Flutter SDK Example",
                  onSuccess: (result) {
                    Text("Success");
                    // ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                    //     Color.fromRGBO(65, 161, 36, 1), result.message.toString()));
                  },
                  onFailure: (e) {
                    Text("Fail");
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(_buildSnackBar(Colors.red, e.message.toString()));
                  },
                ),
                SizedBox(
                  height: 84,
                ),
                Text(
                  "Esewa",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSnackBar(Color color, String msg) {
    return SnackBar(
      backgroundColor: color,
      content: Text(msg),
    );
  }
}
