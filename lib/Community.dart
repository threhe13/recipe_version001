import 'package:flutter/material.dart';

import 'PostScreen.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

final List<Map> posts = [
  {
    "title" : "소프트웨어공학",
    "contents" : "레시피 어플 만드는 중 이런 일이 있을 줄이야. 오늘 몇 시에 잘 수 있을까. 아니 잠은 잘 수 있을까. 이게 무슨 일이야. 이런 일이야 아이고난",
    "author" : "김성현",
    "date" : "2020-12-04"
  }
];

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 30.0),
                  child: Text("커뮤니티", style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                  ),)),
              Expanded(child: ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  //child: PNetworkImage(items[index]["image"]),
                                ),
                                SizedBox(width: 10.0,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Text(posts[0]["title"], style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),),
                                      SizedBox(height: 20.0,),
                                      Text("${posts[0]['contents']}",
                                        style: TextStyle(
                                            fontSize: 18.0
                                        ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  );
                },

                ),
              ),
            ],
          ),
        ),
      );
    }
  }

///TODO : 게시글 생성 버튼 및 게시글 생성 위젯
Widget _buildPost(BuildContext context, int index){
  return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
        builder: (context) => PostScreen()
      ));
    },
  );
}