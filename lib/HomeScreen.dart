import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_version001/RecipeScreeen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  ///image paths and food names
  final images=[
    "assets/photos/image1.jpg",
    "assets/photos/image2.jpg",
    "assets/photos/image3.jpg",
    "assets/photos/image4.jpg",
    "assets/photos/image5.jpg",
  ];

  final foodNames=[
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

  @override
  Widget build(BuildContext context) {

    ///for Screen Size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      /*
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("홈"),),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text("레시피 검색"),),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), title: Text("수준별 레시피"),),
          BottomNavigationBarItem(icon: Icon(Icons.face), title: Text("프로필"),),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("설정"),),
        ],
        iconSize: 30.0,
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
       */
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                ///Container for header
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "오늘의 추천요리",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ///For spacing
                      SizedBox(
                        width: 40,
                      ),

                      /* 메뉴바 만들 예정이었음
                      IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.grey[800],
                          onPressed:(){

                          },
                      )
                       */
                    ],
                  ),
                ),

                ///For vertical Sapcing
                SizedBox(height: 32,),

                ///Container for list of recipe type
                ///give 25percent height relative to screen height
                Container(
                  height: size.height*0.25,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => RecipeScreen(images[index])
                            ));
                          },
                          child: AspectRatio(
                              aspectRatio: 0.9 / 1,

                            ///width : screen,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Hero(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    tag: images[index],
                                  ),
                                ),

                                ///Add Text
                                SizedBox(height:8,),///For spacing
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    "${foodNames[index]} Recipe",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey[800],
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                              ],
                            )
                          ),
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(
                        width: 16,
                      ),
                      itemCount: 4),
                ),

                SizedBox(height: 32,),


                ///For community
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "커뮤니티",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ///For spacing
                      SizedBox(
                        width: 40,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.0,),
                ///for community text
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  ///for debugging community box
                  child: Container(
                    height: 400.0,
                    width:  double.infinity,
                    color: Colors.grey[200],
                    ///list 항목으로 제목 띄우는 것을 목표로 만들 것...
                    child: Center(
                      child: Text("community", style: TextStyle(fontSize: 16.0),)
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
