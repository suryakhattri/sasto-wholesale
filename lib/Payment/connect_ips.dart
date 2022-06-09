import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sasto_wholesale/Payment/connect_ips_setup_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConnectIps extends StatefulWidget {
  const ConnectIps({Key? key}) : super(key: key);

  @override
  _ConnectIpsState createState() => _ConnectIpsState();
}

class _ConnectIpsState extends State<ConnectIps> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  late Future<ConnectIpsModel> _connectIps;
  late WebViewController _webViewController;

  String testUrl = "https://pub.dev/packages/webview_flutter";

  _loadHTMLfromAsset() async {
    String file = await rootBundle.loadString("assets/connect_ips.html");
    _webViewController.loadUrl(Uri.dataFromString(file,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  // ePay deatils
  // double tAmt = 1000;
  // double amt = 800;
  // double txAmt = 100;
  // double psc = 50;
  // double pdc = 50;
  // String scd = "EPAYTEST";
  // String su = "https://github.com/kaledai";
  // String fu = "https://refactoring.guru/design-patterns/factory-method";

  @override
  void initState() {
    super.initState();
    _connectIps = fetchConnectIpsData();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       String pid = UniqueKey().toString();
      //       _webViewController.evaluateJavascript(
      //           'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid", su = "$su", fu = "$fu")');
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
      appBar: AppBar(
        leading: SizedBox.shrink(),
      ),
      body: FutureBuilder<ConnectIpsModel>(
        future: _connectIps,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String url = snapshot.data!.gatewayUrl;
            String merchantId = snapshot.data!.merchantId;
            String appId = snapshot.data!.appId;
            String appName = snapshot.data!.appName;
            String txn_id = snapshot.data!.txnId;
            String txnDate = snapshot.data!.txnDate;
            String txn_crncy = snapshot.data!.txnCrncy;
            String txn_amt = snapshot.data!.txnAmt;
            String reference_id = snapshot.data!.referenceId;
            String particulars = snapshot.data!.particulars;
            String token = snapshot.data!.token;

            return WebView(
              initialUrl: "https://login.connectips.com/connectipswebgw/loginpage",
              javascriptMode: JavascriptMode.unrestricted,
              javascriptChannels: Set.from([
                JavascriptChannel(
                  name: "message",
                  onMessageReceived: (message) {},
                ),
              ]),
              onPageFinished: (data) {
                setState(() {
                  String pid = UniqueKey().toString();
                  // _webViewController.evaluateJavascript(
                  //     'requestPayment(url = $url, merchantId = $merchantId, appId = $appId, appName = $appName, txn_id = $txn_id, txnDate = "$txnDate", txn_crncy = "$txn_crncy", txn_amt = "$txn_amt", reference_id = "$reference_id", particulars = "$particulars", token = "$token")');
                });
              },
              onWebViewCreated: (webViewController) {
                // _controller.complete(webViewController);
                _webViewController = webViewController;
               // _loadHTMLfromAsset();
              },
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
                  ));
        },
      ),
    );
  }
}

Future<ConnectIpsModel> fetchConnectIpsData() async {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // String loginToken = preferences.getString("login_token");
  // int userId = preferences.getInt("userId");

  // var header = {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  //   'Authorization': 'Bearer $loginToken'
  // };

  var url =
      'https://seller.sastowholesale.com/api/setup-connectips-payment/20072';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return new ConnectIpsModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load Ips');
  }
}
