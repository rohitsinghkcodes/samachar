//HOME PAGE FOR SAMACHAR

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:samachar/App%20info/app_info.dart';
import 'package:samachar/Model/article_model.dart';
import 'package:samachar/Model/category_model.dart';
import 'package:samachar/Views/article_View.dart';
import 'package:samachar/Views/category_news.dart';
import 'package:samachar/helper/data.dart';
import 'package:samachar/helper/news_fetch.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController controller = ScrollController();

  final ScrollController mainScrollController = ScrollController();

  //bool noScrollMoreIcon = false;

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> newsArticles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();

    // controller.addListener(() {
    //   if (controller.position.pixels == controller.position.maxScrollExtent) {
    //     setState(() {
    //       noScrollMoreIcon = true;
    //     });
    //   } else {
    //     setState(() {
    //       noScrollMoreIcon = false;
    //     });
    //   }
    // });
  }

  getNews() async {
    NewsFetch newsClass = NewsFetch();
    await newsClass.getNews();
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
          onTap: () {
            mainScrollController.animateTo(0,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },

          //for opening the app info page
          onLongPress: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AppInfo();
            }));
          },
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
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ))
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      //padding for the container Containing categories
                      height: 70.0,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 25,
                            child: ListView.builder(
                              controller: controller,
                              itemCount: categories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CardTile(
                                  //fetching the image url form and Category Namedata.dart file
                                  imageURL: categories[index].imageURL,
                                  categoryName: categories[index].categoryName,
                                );
                              },
                            ),
                          ),
                          //Side scrolling icon
                          //SCROLLING ICON TOOGLE
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.navigate_next,
                                color: Colors.blue,
                                size: 23.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //container for News Articles
                  //Main Content for news area
                  Expanded(
                    flex: 10,
                    child: Container(
                      margin: EdgeInsets.only(top: 15.0),
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
                  ),
                ],
              ),
            ),
    );
  }
}

// Tile/Card frame for the the scrollable category section

class CardTile extends StatelessWidget {
  final imageURL, categoryName;

  CardTile({
    this.imageURL,
    this.categoryName,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryView(category: categoryName.toString().toLowerCase());
        }));
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                //Passing the image Url
                imageUrl: imageURL,
                width: 130.0,
                height: 70.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 130.0,
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                //passing the Category Name
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            )
          ],
        ),
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
