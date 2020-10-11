
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samachar/Views/article_View.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {


  final ScrollController mainScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: GestureDetector(
            //for scrolling news back to initial stage
          onTap: () {
            mainScrollController.animateTo(0,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'About ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
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
        body: ListView(
          controller: mainScrollController,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsetsDirectional.only(top: 20.0),
                    child: CachedNetworkImage(
                        imageUrl:
                            "https://raw.githubusercontent.com/rohitsinghkcodes/RESOURCES/master/samachar/samachar_logo_2mb.png"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Text(
                          'samachar is an application which will enhance your news reading experience.',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'This applications contains the best and top news form multiple news sources, and by clicking on the desired news you will be redirected to to the official news article from where you can read the whole news in detail.',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'The news in this applications in provided in a categorized manner which enhances the user experience.',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        Text('CATEGORIES AVAILABLE :',
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w900)),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          '🔹 Sports',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Science',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Technology',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Entertainment',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Health business',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 70.0,
                        ),
                        Text('TOP HIGHLIGHTS :',
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w900)),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          '🔹 Easy to use',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Engaging news content',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Simple and minimal UI',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Beautiful Dark Theme',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Categorized Section For Use',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '🔹 Top news from multiple news sources',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        Text('GET IN TOUCH :',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w900)),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 160.0),
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              //open github in web view
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ArticleView(
                                  articleUrl:
                                      'https://github.com/rohitsinghkcodes',
                                );
                              }));
                            },
                            child: CachedNetworkImage(
                                imageUrl:
                                    "https://raw.githubusercontent.com/paulrobertlloyd/socialmediaicons/main/github-48x48.png"),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text('ABOUT THE DEVELOPER :',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w900)),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'I am Rohit Kumar Singh and i am the developer of samachar.  I hope you all will love this application and find it useful.',
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          'You can check more of my work on GitHub.',
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Text(
                          '©   R   O   H   I   T    K   U   M   A   R    S   I   N   G   H',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )); 
  }
}


/**/