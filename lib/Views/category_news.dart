//This is for the categorical headline for the news: openned when selected by tapping on some category


import 'package:flutter/material.dart';
import 'package:samachar/Model/article_model.dart';
import 'package:samachar/Views/article_View.dart';
import 'package:samachar/helper/news_fetch.dart';

class CategoryView extends StatefulWidget {
  final String category;
  CategoryView({@required this.category});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final ScrollController mainScrollController = ScrollController();

  List<ArticleModel> newsArticles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    newsArticles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: GestureDetector(
          //for scrolling news back to initial stage
          //NOT IN WORKING STATE
          onTap: () {
            mainScrollController.animateTo(0,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.category.toUpperCase()}',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
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

      //BODY
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  controller: mainScrollController,
                  itemCount: newsArticles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BottomBlogTile(
                        articleUrl: newsArticles[index].url,
                        imageURL: newsArticles[index].urlToImage,
                        title: newsArticles[index].title,
                        description: newsArticles[index].description);
                  }),
            ),
    );
  }
}

//Tile for news section of the sama4 app
class BottomBlogTile extends StatelessWidget {
  final String imageURL, title, description, articleUrl;

  BottomBlogTile(
      {@required this.imageURL,
      @required this.title,
      @required this.description,
      @required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticleView(
            articleUrl: articleUrl,
          );
        }));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageURL)),
            SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
