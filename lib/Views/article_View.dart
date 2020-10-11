//This is for the detailed news in the webview

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String articleUrl;
  final ScrollController mainScrollController = ScrollController();
  ArticleView({this.articleUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  //Controller for the auto scroll on tap(currently not in working state)
  // final ScrollController mainScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          //for scrolling news back to initial stage
          //NOT IN WORKING STATE
          // onTap: () {
          //   mainScrollController.animateTo(0,
          //       duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          // },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'sama',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(
                'char',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.ac_unit_rounded)),
          ),
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.articleUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
        ),
      ),
    );
  }
}
