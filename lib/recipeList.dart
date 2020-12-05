import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'RecipeScreeen.dart';

class recipeList extends StatefulWidget {
  @override
  _RecipeList createState() => _RecipeList();
}

final String sample = "assets/photos/image1.jpg";

class _RecipeList extends State<recipeList> {
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
              ///TODO : 파이어베이스 연동
              Column(
                children: <Widget>[
                  Container(
                    height: 500,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection("recipes").snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        return _buildRecipeList(context, snapshot);
                      },
                    ),
                  )
                ],
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

Widget _buildRecipeList(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
/*
  final ref = FirebaseStorage.instance.ref().child('recipes_img');

  getURL(ref, DocumentSnapshot document) async {
    var data = await FirebaseStorage.instance.ref().child("recipes_img/${document["food"]}").getData();
    var text = new String.fromCharCodes(data);
    print(data);
  }

 */

  if(snapshot.hasError) return Text("Error: ${snapshot.error}");
  switch(snapshot.connectionState){
    case ConnectionState.waiting:
      return Center(
        child: Text("Loading...", style: TextStyle(fontSize: 16.0,),),
      );
    default:
      return ListView(
        children: snapshot.data.documents.map((DocumentSnapshot document) {
          Timestamp tt = document["date"];
          DateTime dt = DateTime.fromMicrosecondsSinceEpoch(tt.microsecondsSinceEpoch);
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => RecipeScreen(document['img']),
              ));
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80.0,
                    child: Image.network(
                      document['img'],
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                    margin: const EdgeInsets.all(16.0),
                  ),
                  Expanded(
                    child: Column(
                        children: <Widget>[
                          Text(
                            document["name"],
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.justify,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                height: 2.0,
                              ),
                              children: [
                                WidgetSpan(
                                  child: const SizedBox(width: 10.0,),
                                ),
                                TextSpan(
                                  text: document["poster"],
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
                                  text: 'Like ${document['like']}',
                                ),

                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      );
  }
}

