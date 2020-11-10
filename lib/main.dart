import 'package:flutter/material.dart';
import 'package:recipe_version001/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Recommend App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: RecipeAPPMenu(),
    );
  }
}

class RecipeAPPMenu extends StatefulWidget {
  @override
  _RecipeAPPMenu createState() => _RecipeAPPMenu();
}

class _RecipeAPPMenu extends State<RecipeAPPMenu> {

  var currentPage = 0;

  var pages = [
    HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("홈"),),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text("레시피 검색"),),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), title: Text("수준별 레시피"),),
          BottomNavigationBarItem(icon: Icon(Icons.face), title: Text("프로필"),),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("설정"),),
        ],
        iconSize: 30.0,

        currentIndex: currentPage,
        onTap: (index){
          setState(() {
            currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      )
    );
  }

}

