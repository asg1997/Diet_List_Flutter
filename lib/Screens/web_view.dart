import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
   WebViewScreen({Key? key,
    this.link = '',
  }) : super(key: key);

  String link;


  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: widget.link,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
