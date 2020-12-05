import 'package:flutter/material.dart';
import 'package:recipe_version001/HomeScreen.dart';
import 'package:recipe_version001/Profile.dart';
import 'package:recipe_version001/login.dart';
import 'package:recipe_version001/mail/signedin_page.dart';
import 'package:recipe_version001/recipeList.dart';
import 'mail/auth_page.dart';
import 'package:recipe_version001/page2.dart';
import 'google_signin/google_signin_demo.dart';
import 'package:provider/provider.dart';
import 'package:recipe_version001/mail/firebase_provider.dart';
import 'Community.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseProvider>(
            create: (_) => FirebaseProvider())
      ],
      child: MaterialApp(
        title: "Recipe Recommend App",
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Firebase")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Google Sign-In Demo"),
            subtitle: Text("google_sign_in Plugin"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GoogleSignInDemo()));
            },
          ),
          ListTile(
            title: Text("Firebase Auth"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AuthPage()));
            },
          )
        ].map((child) {
          return Card(
            child: child,
          );
        }).toList(),
      ),
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
    recipeList(),
    Community(),
    Profile(),
    SignedInPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("홈"),),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text("레시피"),),
          BottomNavigationBarItem(icon: Icon(Icons.comment_outlined), title: Text("커뮤니티"),),
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

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("설정화면", style: TextStyle(fontSize: 40.0),),
      ),
    );
  }
}
