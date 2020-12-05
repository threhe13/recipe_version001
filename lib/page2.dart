import 'package:flutter/material.dart';

import 'RecipeScreeen.dart';

/*
class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

final List<Map> Recipes = [
  //dessert000
  {
    "title" : "에어프라이어 진미채 버터구이 맛있게 만드는법",
    "author" : "김성현",
    "like" : 4,
  },
  //dessert001
  {
    "title" : "모양까지 예쁜 핑거푸드[양송이버섯 타파스]",
    "author" : "김성현",
    "like" : 4,
  },
  //dessert003
  {
    "title" : "[간단 자취요리] 혼술 안주 생성! 닭꼬치 만들기",
    "author" : "김성현",
    "like" : 4,
  },
  //dessert004
  {
    "title" : "모닝빵콘치즈 간단간식 ",
    "author" : "김성현",
    "like" : 4,
  }
];

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    // TODO: implement build
    return DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.yellow,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              textTheme: TextTheme(title: TextStyle(color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.bold)),
              iconTheme: IconThemeData(color: Colors.black),
              actionsIconTheme: IconThemeData(color: Colors.black),
            ),
          ),
          child: Scaffold(
            backgroundColor: Theme.of(context).buttonColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text("단계별 레시피"),
              leading: Icon(Icons.featured_play_list_outlined),
              ///if you want to add search feature
              /*
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: null
                )
              ],*/
              bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                indicatorColor: Colors.yellow,
                unselectedLabelColor: Colors.black,
                tabs: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("1"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("2"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("3"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("4"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("5"),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[

                ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: Recipes.length,
                    itemBuilder: (context, index){
                      return _buildRecipeItem(context, index);
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 16.0,),
                ),

                Container(
                  child: Text("Tab 2"),
                ),
                Container(
                  child: Text("Tab 3"),
                ),
                Container(
                  child: Text("Tab 4"),
                ),
                Container(
                  child: Text("Tab 5"),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

Widget _buildRecipeItem(BuildContext context, int index){
  Map recipe = Recipes[index];
  int like = recipe['like'];
  final String sample = "assets/photos/image1.jpg";
  return GestureDetector(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(
                builder: (context) => RecipeScreen()
                ));
            },
      child:  Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            //margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  width: 80.0,
                  child: Image.asset(
                    sample,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  margin: const EdgeInsets.all(16.0),
                ),
                Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          recipe["title"],
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.justify,
                        ),
                        Text.rich(TextSpan(
                          style: TextStyle(
                            height: 2.0,
                          ),
                          children: [
                            WidgetSpan(
                              ///profile image
                              child: CircleAvatar(
                                radius: 15.0,
                              ),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 10.0,),
                            ),
                            TextSpan(
                              text: recipe["author"],
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 10.0,),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.star_border, size: 14.0,),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 5.0,),
                            ),
                            TextSpan(
                              text: 'Like $like',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          )
        ]
      ),
  );
}*/