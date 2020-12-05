import 'package:flutter/material.dart';
import 'package:recipe_version001/mail/firebase_provider.dart';
import 'package:recipe_version001/mail/signedin_page.dart';
import 'package:recipe_version001/mail/signin_page.dart';
import 'package:provider/provider.dart';
import 'package:recipe_version001/main.dart';

AuthPageState pageState;

class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() {
    pageState = AuthPageState();
    return pageState;
  }
}

class AuthPageState extends State<AuthPage> {
  FirebaseProvider fp;

  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);

    logger.d("user: ${fp.getUser()}");
    if (fp.getUser() != null && fp.getUser().isEmailVerified == true) {
      return RecipeAPPMenu();
        //SignedInPage();
    } else {
      return SignInPage();
    }
  }
}