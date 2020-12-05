import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

final image = "assets/profile/player.jpg";

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {

    ///for screen size
    final size = MediaQuery
        .of(context)
        .size;

    // TODO: implement build
    return Scaffold(

        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: Text("프로필", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),))
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 32.0,
                  ),
                  ClipRRect(
                    child: Container(
                      height: 200.0,
                      width: double.infinity,
                      //color: Colors.grey,

                      child: AspectRatio(
                        aspectRatio: 0.9/1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                child:ClipRRect(
                                  child: Image.asset(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                )
                              ),
                            ),
                            Text("data", style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,),

                            Container(
                              color: Colors.red,
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 32.0,
                  ),

                  SizedBox(
                    height: 32.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: Text("저장한 레시피", style: TextStyle(fontSize: 32.0,),))
                    ],
                  ),
                  Column(
                    children: <Widget>[

                      Container(
                        height: 800.0,
                        width: double.infinity,

                        color: Colors.grey,
                      ),

                    ],
                  ),



                ],
              ),
            ),
          ),
        ),
    );
  }
}


/*
* firebase storage
* service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if request.auth != null;
    }
  }
}
* firebase cloud
* rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if
          request.time < timestamp.date(2021, 1, 3);
    }
  }
}
* */